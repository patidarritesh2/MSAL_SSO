import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { URI } from '../../shared/constants/uri';
import { AuthService } from '../auth.service';

@Injectable()
export class JwtInterceptor implements HttpInterceptor {
  constructor(private authService: AuthService) { }

  // intercept(
  //   request: HttpRequest<any>,
  //   next: HttpHandler
  // ): Observable<HttpEvent<any>> {
  //   const currentUser = this.authService.currentUserValue;
  //   const validToken = (currentUser && currentUser.token) ? currentUser.token : null;
  //   const isSecureRoute = request.url.includes(URI.API.SECURE);
  //   const allowed = validToken && isSecureRoute
  //   if (allowed) {
  //     request = request.clone({
  //       setHeaders: {
  //         Authorization: `Bearer ${validToken}`,
  //       },
  //     });
  //   }
  //   return next.handle(request);
  // }

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    if (localStorage.getItem('token')) {
      req = req.clone({
        setHeaders: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
    }
     return next.handle(req);
  }
  
}
