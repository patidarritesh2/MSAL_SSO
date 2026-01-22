import { Request, Response } from "express";

export const setHeaders = (req: Request, res: Response, next: Function) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "GET,PUT,POST,OPTIONS");
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Content-Type, X-Requested-With, Authorization"
  );
  res.setHeader("Set-Cookie", ["Secure", "HttpOnly"]);
  next();
};
