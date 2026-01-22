import { Injectable } from '@angular/core';
import { Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../auth.service';

@Injectable()
export class AuthGuard {
    constructor(
        private router: Router,
        private authService: AuthService
    ) {
        if (!this.authService.getToken()) {
            this.redirectToLogin();
        }
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

        if (this.authService.currentUserValue.id) {
            if (route.data.roles && this.authService.currentUserValue.roles?.indexOf(route.data.roles) === -1) {
                // role not authorised so redirect to home page
                localStorage.clear();
                sessionStorage.clear();
                this.router.navigate(['/']);
                return false;
            }

            return true;
        }

        // not logged in so redirect to login page with the return url
        localStorage.clear();
        sessionStorage.clear();
        // this.router.navigate(['/login'], { queryParams: { returnUrl: state.url } });

        //for SSO 
        this.router.navigate(['/'], { queryParams: { returnUrl: state.url } });
        return false;
    }

    private redirectToLogin() {
        //  this.router.navigate(['/login']);
        //for SSO 
        this.router.navigate(['/']);
    }
}