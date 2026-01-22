import { Component, ElementRef, OnInit } from '@angular/core';
import { MsalBroadcastService, MsalService } from '@azure/msal-angular';
import { InteractionStatus } from '@azure/msal-browser';
import { Subject } from 'rxjs';
import { filter, takeUntil } from 'rxjs/operators';
import { AuthService } from 'src/app/services/auth.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})

export class AppComponent implements OnInit {
  title = 'MSAL SSO';
  type: any;
  apiUrl: any;
  scopes: any;
  redirectUri: any
  authority: any
  clientId: any
  maxTimeout: any;
  isIframe = false;
  loginDisplay = false;
  private readonly _destroying$ = new Subject<void>();
  accounts: any

  constructor(private broadcastService: MsalBroadcastService, private msalService: MsalService, private elementRef: ElementRef, private authservice: AuthService) {
    this.type = this.elementRef.nativeElement.getAttribute('type');


    this.clientId = this.elementRef.nativeElement.getAttribute('clientId');
    this.authority = this.elementRef.nativeElement.getAttribute('authority');
    this.redirectUri = this.elementRef.nativeElement.getAttribute('redirectUri');
    this.scopes = this.elementRef.nativeElement.getAttribute('scopes');
    this.apiUrl = this.elementRef.nativeElement.getAttribute('apiUrl');

    this.authservice.clientId = this.clientId
    this.authservice.authority = this.authority
    this.authservice.redirectUri = this.redirectUri
    this.authservice.scopes = this.scopes
    this.authservice.apiUrl = this.apiUrl

    this.authservice.url = this.type;

  }


  ngOnInit(): void {
    this.broadcastService.inProgress$
      .pipe(
        filter(status => status === InteractionStatus.None),
        takeUntil(this._destroying$)
      )
      .subscribe(() => {
        const accounts = this.msalService.instance.getAllAccounts();
        if (accounts.length > 0) {
          if (!this.msalService.instance.getActiveAccount()) {
            this.msalService.instance.setActiveAccount(accounts[0]);
          }
          this.tryAcquireToken();
        }
        this.setLoginDisplay();
      });
  }
  tryAcquireToken(): void {
    const account = this.msalService.instance.getActiveAccount();
    if (!account) return;

    this.msalService.acquireTokenSilent({
      scopes: [this.authservice.scopes],
      account
    }).subscribe({
      next: result => {
        localStorage.setItem('authtoken', result.accessToken);
      },
      error: error => {
        console.warn('Silent token acquisition failed:', error);
        this.msalService.acquireTokenRedirect({
          scopes: [this.authservice.scopes],
          account
        });
      }
    });
  }

  setLoginDisplay(): void {
    const account = this.msalService.instance.getAllAccounts()[0];
    this.loginDisplay = !!account;
  }



  ngOnDestroy(): void {
    this._destroying$.next();
    this._destroying$.complete();
  }
}


