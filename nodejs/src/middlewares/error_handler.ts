import { Request, Response, NextFunction } from "express";
import { sendErrorResponse } from "../common/response";
import { CustomError } from "../errors/custom";
import logger from "../common/logger/logger";

export const errorHandler = async (
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (err instanceof CustomError) {
    const errorMessage = `error_handler.ts ,   Message: ${err.message}, Inner exception: ${err.stack || 'N/'}`;
    logger.error(errorMessage);
    return sendErrorResponse(res, err.statusCode, err.serializeErrors())
  }
  const errorMessage = `error_handler.ts ,   Message: ${err.message}, Inner exception: ${err.stack || 'N/'}`;
  logger.error(errorMessage);
  res.status(400).send({
    errors: [{ message: "Something went wrong" }],
  });
};
