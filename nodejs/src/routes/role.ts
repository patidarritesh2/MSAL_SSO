import express, { Request, Response, Router } from "express";
import { API } from "../common/costants";
import { RoleController } from "../controllers/role.controller";

export class RoleRoutes {

	public router: Router;
	public roleController: RoleController = RoleController.getInstance();

	constructor() {
		this.router = Router();
		this.routes();
	}

	routes() {
		this.router.get(API.GET_ROLE, this.roleController.get);
		this.router.get(API.GET_ROLE_BY_ID, this.roleController.getById);
		this.router.get(API.GET_ALL_ROLE, this.roleController.getAll);
		this.router.get(API.CHECK_ROLE, this.roleController.checkRole);
		this.router.post(API.CREATE_ROLE, this.roleController.create);
		this.router.put(API.UPDATE_ROLE, this.roleController.update);
	}
}
