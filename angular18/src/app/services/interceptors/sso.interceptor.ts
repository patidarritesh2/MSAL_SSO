import { BrowserCacheLocation, InteractionType, IPublicClientApplication, LogLevel, PublicClientApplication } from '@azure/msal-browser';
import { MsalInterceptorConfiguration } from '@azure/msal-angular';
import { AuthService } from '../auth.service';




export function MSALInstanceFactory(authService: AuthService): IPublicClientApplication {
  return new PublicClientApplication({
    auth: {
      clientId: authService.clientId,
      authority: authService.authority,
      redirectUri: authService.redirectUri,
      postLogoutRedirectUri: authService.redirectUri,
      navigateToLoginRequestUrl: true
    },
    cache: {
      cacheLocation: BrowserCacheLocation.LocalStorage,
      storeAuthStateInCookie: false
    },

  });
}
export function MSALInterceptorConfigFactory(authService: AuthService): MsalInterceptorConfiguration {
  const protectedResourceMap = new Map<string, Array<string>>();

  protectedResourceMap.set(authService.apiUrl, [authService.scopes]);

  return {
    interactionType: InteractionType.Redirect, // or Popup
    protectedResourceMap
  };
}

export function MSALGuardConfigFactory(authService: AuthService) {
  return {
    interactionType: InteractionType.Redirect,
    authRequest: {
      scopes: ['openid', 'profile', 'email', authService.scopes],

    }
  };
}
