import { Router } from "express";
import { body } from "express-validator";
import { API } from "../common/costants";
import { UserController } from "../controllers/user.controller";
import { verifyJWT } from "../middlewares/cron";
import decryptCredentials from "../middlewares/decryption";
import { AuthorizeAction } from "../middlewares/authorization";


export class UserRoutes {
  public router: Router;
  public userController: UserController = UserController.getInstance();

  constructor() {
    this.router = Router();
    this.routes();
  }

  routes() {
    this.router.get(API.GET_USER_BY_ID, verifyJWT, AuthorizeAction, this.userController.getById);
    this.router.post(API.CREATE_USER, verifyJWT, AuthorizeAction, this.userController.create);
    this.router.post(
      API.UPDATE_PASSWORD,
      decryptCredentials,
      [
        body("password")
          .trim()
          .isLength({ min: 4, max: 20 })
          .withMessage("Password must be between 4 and 20 characters"),
      ],
      this.userController.updatePassword
    );
  }
}
