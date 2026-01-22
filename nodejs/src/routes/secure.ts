import express, { Request, Response, Router } from "express";
import { body } from "express-validator";
import { API } from "../common/costants";
import { SecurityController } from "../controllers/security";

export class SecureRoutes {

	public router: Router;
	public securityController: SecurityController = SecurityController.getInstance();

	constructor() {
		this.router = Router();
		this.routes();
	}

	routes() {
		this.router.get(API.PROFILE, [
			body("email").isEmail().withMessage("Email must be valid"),
			body("password")
				.trim()
				.isLength({ min: 4, max: 20 })
				.withMessage("Password must be between 4 and 20 characters"),
		], this.securityController.getProfile);
	}
}
