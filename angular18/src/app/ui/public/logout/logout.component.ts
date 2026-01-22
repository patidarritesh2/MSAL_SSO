import { Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';
import {UntypedFormBuilder} from '@angular/forms';

declare var $: any;
@Component({
  selector: 'app-login',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.scss'],
})
export class LogoutComponent implements OnInit {  constructor(
    public fb: UntypedFormBuilder,
    private router: Router,
  ) {
  }

  ngOnInit(): void {
    localStorage.clear();
   
    };

    login() {
      this.router.navigate(['/']);
    }
    
}