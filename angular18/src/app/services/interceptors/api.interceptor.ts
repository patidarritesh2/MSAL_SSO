import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { finalize } from 'rxjs/operators';

@Injectable()
export class APIInterceptor implements HttpInterceptor {

  constructor(private readonly authService: AuthService, private readonly spinner: NgxSpinnerService,) { }
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    this.spinner.show();
    const url = this.authService.url;
    const apiReq = req.clone({ url: `${url}${req.url}` });
    return next.handle(apiReq).pipe(finalize(() => this.spinner.hide()));
  }
}