import { ValidationError } from "express-validator";
import { CustomError } from "./custom";
import logger from "../common/logger/logger";

export class RequestValidationError extends CustomError {
  statusCode = 400;

  constructor(public errors: ValidationError[]) {
    super("Invalid request parameters");
    Object.setPrototypeOf(this, RequestValidationError.prototype);
  }

  serializeErrors() {
    return this.errors.map((err: any) => {
      const errorMessage = `request validation.ts ,   Message: ${err.msg} Inner exception: ${err.stack || 'N/'}`;
      logger.error(errorMessage);
      return { message: err.msg, field: err.param };
    });
  }
}
