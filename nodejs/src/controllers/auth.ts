
import "../services/passport";

export class AuthController {
  private static instance: AuthController;
  userData = [];
  private constructor() { }

  public static getInstance(): AuthController {
    if (!AuthController.instance) {
      AuthController.instance = new AuthController();
    }
    return AuthController.instance;
  }

}