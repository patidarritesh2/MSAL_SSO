import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable()
export class AuthService {
  url: any;
  apiUrl: any;
  scopes: any;
  redirectUri: any
  authority: any
  clientId: any
  static currentUserValue: any;




  constructor(private http: HttpClient, private router: Router) {

  }




  init(): Promise<void> {
    return new Promise((resolve) => {
      const el = document.querySelector('app-root');
      if (el) {
        this.apiUrl = el.getAttribute('apiUrl') || '';
        this.scopes = el.getAttribute('scopes') || '';
        this.redirectUri = el.getAttribute('redirectUri') || '';
        this.authority = el.getAttribute('authority') || '';
        this.clientId = el.getAttribute('clientId') || '';
      }
      resolve();
    });
  }

  public logout = () => {
    localStorage.clear();
    this.router.navigate(['/logout']);
  };
}
