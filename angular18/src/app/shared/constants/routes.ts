import { HeaderComponent } from 'src/app/ui/secure/header/header.component';
import PATH from './paths';
import { AuthGuard } from 'src/app/services/interceptors/auth.guard'; import { Routes } from "@angular/router";
import { MsalGuard } from '@azure/msal-angular';
import { SsoComponent } from 'src/app/ui/public/SSO/sso.component';
import { LogoutComponent } from 'src/app/ui/public/logout/logout.component';
import { FooterComponent } from 'src/app/ui/secure/footer/footer.component';
import { DashboardComponent } from 'src/app/ui/secure/dashboard/dashboard.component';

const ROUTES_APP: Routes = [
  {
    path: 'sso',
    component: SsoComponent,
    canActivate: [
      MsalGuard
    ]
  },
  { path: PATH.BROWSER.LOGOUT, component: LogoutComponent },
  { path: PATH.BROWSER.HEADER, component: HeaderComponent },
  { path: PATH.BROWSER.FOOTER, component: FooterComponent },

  {
    path: PATH.BROWSER.WILDCARD, redirectTo: 'sso',
    pathMatch: "full",
  },
];

const ROUTES_SECURE: Routes = [
  {
    path: PATH.BROWSER.EMPTY,
    children: [
      {
        path: PATH.BROWSER.EMPTY,
        redirectTo: PATH.BROWSER.DASHBOARD,
        pathMatch: "full",
      },
      {
        path: PATH.BROWSER.DASHBOARD, canActivate: [AuthGuard],
        data: { isPremium: false },
        component: DashboardComponent
      },

    ],
  },
];

const ROUTES = {
  ROUTES_APP,
  ROUTES_SECURE,
};

export default ROUTES;
