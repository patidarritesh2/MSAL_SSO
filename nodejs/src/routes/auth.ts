import { Router } from "express";
import { body } from "express-validator";
import { API } from "../common/costants";
import { AuthController } from "../controllers/auth";
import decryptCredentials from "../middlewares/decryption";
import { MAX_FILE_SIZE } from "../config/envfield";
import { attachAuthInfo, azureAuthMiddleware, azureSSOLogin } from "../middlewares/sso";

const multer = require('multer');
const upload = multer({
  storage: multer.memoryStorage(), limits: {
    fileSize: MAX_FILE_SIZE, // 10 MB in bytes
  }
});
export class AuthRoutes {
  public router: Router;
  public authController: AuthController = AuthController.getInstance();

  constructor() {
    this.router = Router();
    this.routes();
  }

  routes() {
    this.router.post(API.LOGIN, [
      decryptCredentials,
      body("username"), //.isEmail().withMessage("Email must be valid"),
      body("password")
        .trim()
        .isLength({ min: 4, max: 20 })
        .withMessage("Password must be between 4 and 20 characters"),
    ],
      this.authController.login
    );
    this.router.put(
      API.SIGNUP, upload.single('logo'),
      this.authController.signup
    );
    this.router.put(
      API.CHECK_USERNAME,
      this.authController.checkUser
    );
    this.router.put(
      API.CHECK_EMAIL,
      this.authController.checkEmail
    );
    this.router.get(
      API.GET_USERNAME,
      this.authController.getUserName
    )
    this.router.post(
      API.ADAUTH,
      this.authController.adauth
    )
    this.router.get(
      API.GET_SSO_USERDETAILS, azureAuthMiddleware, attachAuthInfo, azureSSOLogin
    )

  }
}
