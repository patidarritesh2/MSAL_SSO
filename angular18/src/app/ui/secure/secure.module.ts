import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SecureRoutingModule } from './secure-routing.module';
import { SidebarComponent } from './sidebar/sidebar.component';
import { HeaderComponent } from './header/header.component';
import { MatStepperModule } from '@angular/material/stepper';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BreadcrumpComponent } from './breadcrump/breadcrump.component';
import { FooterComponent } from './footer/footer.component';
import { MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { CKEditorModule } from 'ng2-ckeditor';
import { NgxSpinnerModule } from 'ngx-spinner';
@NgModule({
  declarations: [
    SidebarComponent,
    HeaderComponent,
    BreadcrumpComponent,
    FooterComponent,
  ],
  imports: [
    CommonModule,
    SecureRoutingModule,
    MatIconModule,
    NgxSpinnerModule,
    MatStepperModule,
    FormsModule,
    ReactiveFormsModule,

  ],

  exports: [MatDialogModule, CKEditorModule],
})
export class SecureModule { }
