import { BrowserModule } from '@angular/platform-browser';
import { APP_INITIALIZER, NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthService } from './services/auth.service';
import { AuthGuard } from './services/interceptors/auth.guard';
import { AngularMaterialModule } from './shared/angular-material.module';
import { AppComponent } from './ui/app/app.component';
import { SecureModule } from './ui/secure/secure.module';
import { ErrorInterceptor } from './services/interceptors/error.interceptor';
import { HTTP_INTERCEPTORS, provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { JwtInterceptor } from './services/interceptors/jwt.interceptor';
import { APIInterceptor } from './services/interceptors/api.interceptor';
import { MAT_DATE_LOCALE } from '@angular/material/core';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { AutocompleteLibModule } from 'angular-ng-autocomplete';
import { MatSelectFilterModule } from 'mat-select-filter';
import { MSAL_GUARD_CONFIG, MSAL_INSTANCE, MSAL_INTERCEPTOR_CONFIG, MsalGuard, MsalInterceptor, MsalModule, MsalService } from '@azure/msal-angular';
import { MSALGuardConfigFactory, MSALInstanceFactory, MSALInterceptorConfigFactory } from './services/interceptors/sso.interceptor';
import { LogoutComponent } from './ui/public/logout/logout.component';
import { SsoComponent } from './ui/public/SSO/sso.component';
import { NgxSpinnerModule } from 'ngx-spinner';


export function initializeConfig(authService: AuthService) {
  return () => authService.init();
}
@NgModule({
  declarations: [
    AppComponent,
    LogoutComponent,
    SsoComponent
  ],
  bootstrap: [AppComponent], imports: [MsalModule, BrowserModule,
    AppRoutingModule,
    SecureModule,
    NgxSpinnerModule,
    MatAutocompleteModule,
    AutocompleteLibModule,
    NgMultiSelectDropDownModule.forRoot(),
    BrowserAnimationsModule,
    ToastrModule.forRoot({
      positionClass: 'toast-bottom-right'
    }),
    AngularMaterialModule,
    FormsModule,
    ReactiveFormsModule,
    MatSelectFilterModule,
  ], providers: [
    AuthGuard,
    AuthService,
    ErrorInterceptor,
    MsalService,
    MsalGuard,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeConfig,
      deps: [AuthService],
      multi: true
    },
    {
      provide: MSAL_INSTANCE,
      useFactory: MSALInstanceFactory,
      deps: [AuthService],
    },
    {
      provide: MSAL_INTERCEPTOR_CONFIG,
      useFactory: MSALInterceptorConfigFactory,
      deps: [AuthService],
    },
    {
      provide: MSAL_GUARD_CONFIG,
      useFactory: MSALGuardConfigFactory,
      deps: [AuthService],
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: MsalInterceptor,
      multi: true
    },
    { provide: HTTP_INTERCEPTORS, useClass: APIInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    { provide: MAT_DATE_LOCALE, useValue: 'en-GB' },
    provideHttpClient(withInterceptorsFromDi())
  ]
})
export class AppModule { }
