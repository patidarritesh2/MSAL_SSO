import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-breadcrump',
  templateUrl: './breadcrump.component.html',
  styleUrls: ['./breadcrump.component.scss']
})
export class BreadcrumpComponent implements OnInit {
  @Input() name: any;
    

  constructor() { }

  ngOnInit(): void {
    setTimeout(() => {
     
    }, 1000);
  }

}
