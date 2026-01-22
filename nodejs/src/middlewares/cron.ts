
import User from '../models/user/user';
import cryptos, { JWT_SECRET } from '../common/cryptoengine';
import logger from "../common/logger/logger";
const jwt = require('jsonwebtoken');

// Middleware to check for JWT token
export const verifyJWT = async (req: any, res: any, next: any) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    const errorMessage = `cron.ts ,   Message: ${'Unauthorized User'}`;
    logger.warn(errorMessage);
    res.status(401).send('Unauthorized User');
    return;
  }

  const token = authHeader.split(' ')[1];
  if (!token) {
    const errorMessage = `cron.ts , Message: Unauthorized User - Token missing`;
    logger.warn(errorMessage);
    return res.status(401).send('Unauthorized User - Token missing');
  }
  try {
    const decryptedToken = cryptos.decrypt(token);
    const decoded: any = jwt.verify(decryptedToken, JWT_SECRET);
    const user = await User.findOne({ where: { id: decoded.user._id } });
    if (!user) {
      const errorMessage = `cron.ts ,   Message: ${'Unauthorized: User not found'}`;
      logger.warn(errorMessage);
      return res.status(401).send('Unauthorized: User not found');
    }
    req.user = decoded.user;
    next();

  } catch (error) {
    const errorMessage = `cron.ts ,   Message: ${error.message}, Inner exception: ${error.stack || 'N/'}`;
    logger.error(errorMessage);
    return res.status(401).send('Unauthorized invalid token format');
  }
};








