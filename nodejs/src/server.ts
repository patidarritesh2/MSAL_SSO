// Global error handling for unhandled promise rejections
process.on('unhandledRejection', (reason: any, promise: any, error: any) => {
  console.error('Unhandled Rejection at:', promise, reason, error);
  // Don't call process.exit() here, just log the error and keep the application running
});

// Global error handling for uncaught exceptions
process.on('uncaughtException', (err) => {
  console.error('Uncaught Exception:', err);
  // Don't call process.exit() here, just log the error and keep the application running
});

import { DB_NAME } from "./config/secret";

// General Imports
import express from "express";
import compression from "compression";
import cors from "cors";
import bodyParser, { json } from "body-parser";
import "express-async-errors";
// Security Imports
import helmet from "helmet";
// Project Imports
import { DB_INIT } from "./config";
import sequelizeInstance from "./config/database";
import User from "./models/user/userDetail";
import { errorHandler } from "./middlewares/error_handler";
import { AuthRoutes } from "./routes/auth";
import { UserRoutes } from "./routes/user";
import { RoleRoutes } from "./routes/role";
import passport from "passport";
import { SecureRoutes } from "./routes/secure";
import { verifyJWT } from "./middlewares/cron";
import UserDetail from "./models/user/userDetail";
import logger from "./common/logger/logger";
import { DatabaseConnectionError } from "./errors/database";
import { bearerStrategy } from "./middlewares/sso";
export const PATH_NAME = __dirname;
class Server {
  public app: express.Application;

  constructor() {
    this.app = express();
    this.configure();
    this.setRoutes();
    passport.use(bearerStrategy);
    this.app.use(passport.initialize());
  }


  public status = () => {

    this.app.get("/status", async (req: any, res: any) => {
      try {
        const message = " API running";
        logger.info(message);
        try {
          await sequelizeInstance.authenticate();
          res.status(200).json({
            status: "healthy",
            timestamp: new Date(),
            message: "Server is running and connected to the database and fetched data.",

          });

          logger.info("Server is running, connected to the database, and fetched data successfully.");
        } catch (error) {
          res.status(500).json({
            status: "unhealthy",
            error: error.message,
            timestamp: new Date(),
          });
          logger.error("Database connection or data fetching failed", error.stack);
        }
      } catch (error) {
        const errorMessage = `server.ts, Message:  API not running, Inner exception: ${error.stack || 'N/A'}`;
        logger.error(errorMessage);
        res.status(500).json({
          status: "unhealthy",
          error: errorMessage,
        });
      }
    });
  };




  private initializeDatabase = async () => {
    try {
      await User.sync({ force: false });
      await UserDetail.sync({ force: false });
      logger.info(`Database initialized : ${DB_NAME}`);
    } catch (error) {
      logger.error(`Failed to initialize the database : ${DB_NAME}`, error);
    }
  };

  private connectToDatabase = async () => {
    try {
      await sequelizeInstance.authenticate();
      logger.info(`Connected to database: ${DB_NAME}`);
    } catch (error) {
      logger.error(`Failed to connect to database : ${DB_NAME}`, error);
      throw new DatabaseConnectionError();
    }
  };

  public configure = () => {

    this.app.set("port", process.env.PORT || 3000);
    this.app.use(bodyParser.json({ limit: '10mb' })); // increase as needed
    this.app.use(bodyParser.urlencoded({ limit: '10mb', extended: true }));
    this.app.use(express.json({ limit: '10mb' }));
    this.app.use(express.urlencoded({ extended: true }));
    this.app.use(compression());
    this.app.use(cors());
    this.app.use(json());
    this.app.use(helmet.frameguard());
    this.app.use(helmet());
    this.app.use(helmet.xssFilter());  // Disable browsers' internal XSS filtering protection to allow helmet's settings
    this.app.use(helmet.noSniff());  // Prevent browsers from guessing MIME types
    this.app.use('/uploads', express.static('uploads'));
    // Middleware to handle CORS
    this.app.use((req: any, res: any, next) => {
      res.setHeader('Access-Control-Allow-Origin', '*');
      res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, content-type');

      // Handle preflight requests
      if (req.method === 'OPTIONS') {
        return res.sendStatus(204); // No Content
      }

      next();
    });

  }

  public setRoutes = () => {
    this.status();
    this.app.use('/api/auth', new AuthRoutes().router);
    this.app.use('/api/user', new UserRoutes().router);
    this.app.use('/api/role', verifyJWT, new RoleRoutes().router);




    this.app.all("*", (req: any, res: any) => {
      logger.silly(`Resource Not Found. Please check your request. URL: ${req.url}`);
      res.send({
        message: "Resource Not Found. Please check your request.",
        data: [],
      })
    }
    );
    this.app.use(errorHandler);

  }


  public start = async () => {
    const SERVER_PORT = process.env.PORT || 9000;
    try {
      this.app.listen(SERVER_PORT, () => {
        logger.info(`Server listening on Port: ${SERVER_PORT}`);
      });
      // Database
      await this.connectToDatabase();
      if (DB_INIT) await this.initializeDatabase();
    } catch (error) {
      console.error("Error starting the server", error);
    }
  }
}

const server = new Server();
server.start();
