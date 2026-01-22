export const azureConfig = {
  "credentials": {
    //API SERVER CREDENTIALS
    "tenantID": "742fb1e4-7dc5-4387-8e87-2f885f8f871c",
   "clientID": "9ab46408-028d-4da0-978f-38b389b4a901",
    "audience": "9ab46408-028d-4da0-978f-38b389b4a901"
  },
  "resource": {
    "scope": ["access_as_user"]
  },
  "metadata": {
    "authority": "sts.windows.net",
    "discovery": ".well-known/openid-configuration",
    "version": "v2.0"
  },
  "settings": {
    "validateIssuer": false,
    "passReqToCallback": false,
    "loggingLevel": "info"
  }
}
