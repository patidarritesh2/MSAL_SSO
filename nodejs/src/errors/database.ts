import { CustomError } from "./custom";

export class DatabaseConnectionError extends CustomError {
  statusCode = 500;
  reason = "Error connecting to database";

  constructor() {
    super("Error connecting to Database.");
    Object.setPrototypeOf(this, DatabaseConnectionError.prototype);
  }

  serializeErrors() {
    return [{ message: this.reason }];
  }
}

export class ILIUniqueConstraintError extends CustomError {
  statusCode = 500;
  reason = "One or more values provided must be unique.";

  constructor(reason: string) {
    super("Unique constraint violated.");
    Object.setPrototypeOf(this, ILIUniqueConstraintError.prototype);
    this.reason = reason
  }

  serializeErrors() {
    return [{ message: this.reason }];
  }
}

export class DatabaseUnknownError extends CustomError {
  statusCode = 500;
  reason = "Unknown database error.";

  constructor(reason?: string) {
    super("Unknown database error.");
    if (reason)
      this.reason = reason
    Object.setPrototypeOf(this, DatabaseUnknownError.prototype);
  }

  serializeErrors() {
    return [{ message: this.reason }];
  }
}
export class AuthenticateError extends CustomError {
  statusCode = 423;
  reason = "login failed";

  constructor(reason?: string) {
    super("login failed");
    if (reason)
      this.reason = reason
    Object.setPrototypeOf(this, AuthenticateError.prototype);
  }

  serializeErrors() {
    return [{ message: this.reason }];
  }
}