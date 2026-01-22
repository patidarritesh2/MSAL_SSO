import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CONSTANTS } from 'src/app/shared/constants';

const routes: Routes = CONSTANTS.ROUTES.ROUTES_SECURE;

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SecureRoutingModule {}
