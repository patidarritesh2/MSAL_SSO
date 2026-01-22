import logger from "../common/logger/logger";
import { CustomError } from "./custom";

export class RecordNotFoundError extends CustomError {
  statusCode = 404;

  constructor() {
    super("Requested record not found.");

    Object.setPrototypeOf(this, RecordNotFoundError.prototype);
  }

  serializeErrors() {
    const errorMessage = `record not found.ts ,   Message: ${'Requested record not found. '}`;
    logger.error(errorMessage);
    return [{ message: "Requested record not found." }];
  }
}
