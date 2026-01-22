import { CustomError } from "./custom";

export class UnknownError extends CustomError {
  statusCode = 404;

  constructor() {
    super("Unknown Error.");
    Object.setPrototypeOf(this, UnknownError.prototype);
  }

  serializeErrors() {
    return [{ message: "Unknown Error." }];
  }
}
