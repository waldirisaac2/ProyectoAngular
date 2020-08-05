import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms'
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule }  from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { LoginComponent } from './components/login/login.component';
import { SignupComponent } from './components/signup/signup.component';
import { ProfileComponent } from './components/profile/profile.component';
import { RequestResetComponent } from './components/password/request-reset/request-reset.component';
import { ResponseResetComponent } from './components/password/response-reset/response-reset.component';

import { LogindatosService } from './services/logindatos.service';
import { LoginSignupService } from './services/auth/login-signup.service';
import { TokenService } from './services/auth/token.service';
import { AuthService } from './services/auth/auth.service';
import { AfterLoginService } from './services/auth/after-login.service';
import { BeforeLoginService } from './services/auth/before-login.service';

import { SnotifyModule, SnotifyService, ToastDefaults } from 'ng-snotify';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { EgresadoIndexComponent } from './egresado-index/egresado-index.component';
import { IndexIndexComponent } from './index-index/index-index.component';
import { MostrarEgresadoIndexComponent } from './mostrar-egresado-index/mostrar-egresado-index.component';
import { MostrarEgresadoFormComponent } from './mostrar-egresado-form/mostrar-egresado-form.component';
import { DetalleIndexComponent } from './detalle-index/detalle-index.component';
import { DetalleFormComponent } from './detalle-form/detalle-form.component';
import { CursoIndexComponent } from './curso-index/curso-index.component';
import { CursoFormComponent } from './curso-form/curso-form.component';
import { EmpresaIndexComponent } from './empresa-index/empresa-index.component';
import { EmpresaFormComponent } from './empresa-form/empresa-form.component';
import { PerfilegresadoComponent } from './perfilegresado/perfilegresado.component';
import { EmpresaEgreComponent } from './empresa-egre/empresa-egre.component';
import { FilterPipe } from './pipes/filter.pipe';


import { MatSliderModule } from '@angular/material/slider';

const appRoutes: Routes = [


  { path: 'mostraregresadosindex',  component: MostrarEgresadoIndexComponent ,
  canActivate: [AfterLoginService]},
  { path: 'mostraregresadosform',  component: MostrarEgresadoFormComponent ,
  canActivate: [AfterLoginService]},
  { path: 'mostraregresadosform/:id',  component: MostrarEgresadoFormComponent ,
  canActivate: [AfterLoginService]},
  
  
  { path: 'detalleindex',  component: DetalleIndexComponent ,
  canActivate: [AfterLoginService]},
  { path: 'detalleform',  component: DetalleFormComponent ,
  canActivate: [AfterLoginService]},
  { path: 'detalleform/:id',  component: DetalleFormComponent ,
  canActivate: [AfterLoginService]},

  { path: 'cursos_index',  component: CursoIndexComponent,
  canActivate: [AfterLoginService] },
  { path: 'cursos_form',  component: CursoFormComponent,
  canActivate: [AfterLoginService] },
  { path: 'cursos_form/:id',  component: CursoFormComponent,
  canActivate: [AfterLoginService] },
  

  { path: 'empresa_index',  component: EmpresaIndexComponent,
  canActivate: [AfterLoginService] },
  { path: 'empresa_form',  component: EmpresaFormComponent,
  canActivate: [AfterLoginService] },
  { path: 'empresa_form/:id',  component: EmpresaFormComponent,
  canActivate: [AfterLoginService] },

  { path: 'egresadoem/:id',  component: EmpresaEgreComponent,
  canActivate: [AfterLoginService] },

  
  { path: 'perfilegresado',  component: PerfilegresadoComponent,
  canActivate: [AfterLoginService] },


  { path: '**', component: PageNotFoundComponent,
  canActivate: [AfterLoginService] },

];


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    LoginComponent,
    SignupComponent,
    ProfileComponent,
    RequestResetComponent,
    ResponseResetComponent,

    PageNotFoundComponent,
    EgresadoIndexComponent,


    FilterPipe,

    
    IndexIndexComponent,
    MostrarEgresadoIndexComponent,
    MostrarEgresadoFormComponent,
    DetalleIndexComponent,
    DetalleFormComponent,
    CursoIndexComponent,
    CursoFormComponent,
    EmpresaIndexComponent,
    EmpresaFormComponent,
    PerfilegresadoComponent,
    EmpresaEgreComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    SnotifyModule,
    BrowserAnimationsModule,
    MatSliderModule,
    RouterModule.forRoot(
      appRoutes,
      
    )
  ],
  providers: [
    LogindatosService,
    LoginSignupService,
    TokenService,
    AuthService,
    AfterLoginService,
    BeforeLoginService,
    { provide: 'SnotifyToastConfig', useValue: ToastDefaults},
    SnotifyService
  ],
  bootstrap: [AppComponent]
})

export class AppModule { }
