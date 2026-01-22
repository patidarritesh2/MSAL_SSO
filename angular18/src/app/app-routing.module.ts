import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CONSTANTS } from './shared/constants';

const routes: Routes = CONSTANTS.ROUTES.ROUTES_APP
@NgModule({
  imports: [RouterModule.forRoot(routes,{ useHash: true }) ],
  exports: [RouterModule],
})
export class AppRoutingModule {}
