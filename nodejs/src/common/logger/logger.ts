// src/logger/log.ts
import winston from 'winston';
import { config } from '../../config/pwc_config_value';
const DailyRotateFile = require('winston-daily-rotate-file');
// Create the logger
const transports: winston.transport[] = []
  new winston.transports.Console(),
transports.push(
  new winston.transports.Console({
    format: winston.format.combine(
      winston.format.timestamp(),
      winston.format.json()
    )
  })
);

// Only add file-based logging if App Insights is not used
if (!config.ui.isApplicationInsight) {
  transports.push(
    new DailyRotateFile({
      filename: 'logs/app-%DATE%.log',
      datePattern: 'YYYY-MM-DD',
      zippedArchive: true,
      maxSize: '20m',
      maxFiles: '2d'
    }),
    new winston.transports.File({ filename: 'logs/app.log' }),
    new winston.transports.File({ filename: 'logs/error.log', level: 'error' })
  );
}
const logger = winston.createLogger({
  levels: {
    error: 0,
    warn: 1,
    info: 2,
    http: 3,
    verbose: 4,
    debug: 5,
    silly: 6
  },
  level: 'debug', // Minimum level to log
  format: winston.format.combine(
    winston.format.timestamp({format: 'DD-MM-YYYY HH:mm:ss'}),
    winston.format.printf(({ timestamp, level, message, stack }) => {
      if (stack) {
        return `[${timestamp}] [${level}]: [${message}], [Stack: ${stack}]`;
      }
      // Default format without stack
      return `[${timestamp}] [${level}]: [${message}]`;
    })
  ),
  transports: transports
  });
// Export the logger to be used in other parts of the app
export default logger;
