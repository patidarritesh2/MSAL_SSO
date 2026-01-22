import { URI } from "./uri";
import PATH from "./paths"
import ROUTES from "./routes"
import { environment } from 'src/environments/environment';
import appconfigjson from '../../../assets/app-config.json';

export const CONSTANTS = {
  ENV_NAME: environment.NAME,
  ENV_URI:  appconfigjson.API_URI,
  PATH,
  URI,
  ROUTES
}
