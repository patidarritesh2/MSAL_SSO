import passport from "passport";
import { azureConfig } from "../config/azure.config";
import { BearerStrategy } from 'passport-azure-ad';
import { ITokenPayload } from 'passport-azure-ad';
import { sendSuccessResponse } from "../common/response";
import logger from "../common/logger/logger";
import UserDetail from "../models/user/userDetail";
import cryptos, { JWT_SECRET } from "../common/cryptoengine";
import User from "../models/user/user";
import { config } from "../config/pwc_config_value";
const jwt = require('jsonwebtoken');

export const azureAuthMiddleware = passport.authenticate('oauth-bearer', {
  session: false,
});

// Middleware to attach user info to `res.locals` if needed
export const attachAuthInfo = (req: any, res: any, next: any) => {
  res.locals.authInfo = req.authInfo;
  next();
};
// Bearer strategy options
const options: BearerStrategy.BearerStrategyOptions = {
  identityMetadata: `https://${azureConfig.metadata.authority}/${azureConfig.credentials.tenantID}/${azureConfig.metadata.version}/${azureConfig.metadata.discovery}`,

  issuer: null, // Optional if you're using tenant-specific endpoints
  validateIssuer: azureConfig.settings.validateIssuer,
  clientID: azureConfig.credentials.clientID,
  audience: azureConfig.credentials.audience,
  passReqToCallback: azureConfig.settings.passReqToCallback,
  loggingLevel: azureConfig.settings.loggingLevel,
  scope: azureConfig.resource.scope,
  loggingNoPII: true,
  clockSkew: 320,
};

export const bearerStrategy = new BearerStrategy(
  options,
  (token: ITokenPayload, done: Function) => {
    const user = {
      oid: token.oid,                       // Azure AD Object ID
      email: token.preferred_username,     // Usually email
      name: token.name,
      roles: token.roles || [],
      // add more if needed
    };
    return done(null, user, token);
  }
);




export const azureSSOLogin = async (req: any, res: any, next: any) => {
  const tokenPayload = req.authInfo;
  const email = tokenPayload.email;
  const name = tokenPayload.name;
  try {
    const user = await User.findOne({ where: { username: email } });
    if (!user) {
      const message: string = `User ${name} with email ${email} is not registered in the system.`;
      const errorMessage = `SSO middleware.ts ,   Message: ${message} `;
      logger.error(errorMessage);
      logger.error(`User not found : ${name}`);
      return res.status(400).json({ message });
    }
    await User.update({ SessionToken: '' }, { where: { id: user.id } });
    const token = jwt.sign({
      user: {
        _id: user.id,
        username: user.username,
      }
    }, JWT_SECRET, { expiresIn: '1d' });

    await User.update({ SessionToken: token }, { where: { id: user.id } });

    let _user = await UserDetail.findOne({
      where: { userId: user.id },
      attributes: {
        exclude: ['email', 'secondaryEmail',
          'middleName',
          'dob',
          'nationality',
          'createdBy',
          'createdAt',
          'addedAt',

          'intimationModeUptil'
        ]
      }
    });
    if (_user) {
      let id: any = 0;
      id = _user?.designationId;

    }

    const encryptedToken = cryptos.encrypt(token);
    sendSuccessResponse(res, [{
      user: _user,
      token: encryptedToken,
    }]);

  } catch (error) {
    logger.error(`Azure SSO login failed: ${error.stack} , Message : ${error.message}`);
    return res.status(500).send('Internal Server Error');
  }
};

export const pwcConfigValue = async (req: any, res: any, next: any) => {
  try {
    res.json({ config });
  } catch (error) {

    logger.error(`config value is not fetched: ${error.stack} , Message : ${error.message}`);
  }

}