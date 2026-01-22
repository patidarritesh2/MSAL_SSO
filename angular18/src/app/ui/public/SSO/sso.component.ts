import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { MsalService } from '@azure/msal-angular';
import { AccountInfo } from '@azure/msal-browser';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from 'src/app/services/auth.service';
@Component({
  selector: 'app-example',
  templateUrl: './sso.component.html',
  styleUrls: ['./sso.component.scss']
})
export class SsoComponent implements OnInit {
  userProfile: any = null;
  account: AccountInfo | null = null;
  user: any;
  userData: any;
  loading: boolean = true;
  error: string | null = null;
  constructor(private authService: AuthService, private http: HttpClient, private msalService: MsalService, private router: Router,
    private toastr: ToastrService) { }

  ngOnInit(): void {
    const account = this.msalService.instance.getAllAccounts()[0];
    if (account) {
      this.msalService.instance.setActiveAccount(account);
      this.acquireToken();
    } else {
      this.msalService.loginRedirect();
    }
  }
  acquireToken(): void {
    const activeAccount = this.msalService.instance.getActiveAccount();
    if (!activeAccount) {
      console.warn('No active account for token acquisition');
      return;
    }

    this.msalService.acquireTokenSilent({
      scopes: [this.authService.scopes],
      account: activeAccount
    }).subscribe({
      next: () =>
        this.callBackend(),
      error: error => {
        console.error('Token acquisition failed:', error);
        this.msalService.loginRedirect();
      }
    });
  }
  callBackend(): void {
    this.loading = true;
    this.error = null;
    this.authService.sso().subscribe({
      next: (data: any) => {
        this.loading = false;
        if (data) {
          const user = data[0];
          const userData = user.user;
          if (user.state === 'Activate') {
            // Set localStorage and subject only if user is active
            localStorage.setItem('currentUser', JSON.stringify(userData));
            localStorage.setItem('token', user.token);
            localStorage.setItem('roles', JSON.stringify(user.roles));
            this.authService.currentUserSubject.next(userData);

          } else {
            this.toastr.error('Your account is deactivated');
            localStorage.clear();
            sessionStorage.clear();
          }
        } else {
          this.toastr.error('Invalid login response');
          localStorage.clear();
          sessionStorage.clear();
        }
      },
      error: err => {
        this.loading = false;
        localStorage.clear();
        sessionStorage.clear();
        // Show proper backend error if available
        const message = err || err?.error?.message;
        this.toastr.error(message);
        this.error = message;
        console.error(err);
      }
    });
  }



  retry(): void {
    this.router.navigate(['/logout']);
  }
}
