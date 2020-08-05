import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth/auth.service';
import { TokenService } from '../services/auth/token.service';
import { Router } from '@angular/router';
import { LogindatosService } from 'src/app/services/logindatos.service';


@Component({
  selector: 'app-index-index',
  templateUrl: './index-index.component.html',
  styleUrls: ['./index-index.component.css']
})
export class IndexIndexComponent implements OnInit {
  
  public loggedIn: boolean;
  public loggedOn: boolean;

  constructor(
    private Auth: AuthService,
    private router: Router,
    private Token: TokenService,
    private datos: LogindatosService

  	) { }

 
    list;

    ngOnInit() {
      this.Auth.authStatus.subscribe(value => this.loggedIn = value);
      this.listar()
    }
  
    logout(event: MouseEvent) {
      event.preventDefault();
      this.Token.remove();
      this.Auth.changeAuthStatus(false);
      this.router.navigateByUrl('/login');
    }
    listar(){
      this.datos.datos(this.Token.get()).subscribe(
        data => this.handleResponse(data),
        error => this.handleError()
      );
    }
    handleResponse(data) {
      this.list= data;
      console.log(data)
    }
    handleError() {
      this.Token.remove();
      this.Auth.changeAuthStatus(false);
      this.router.navigateByUrl('/login');
    }
    

}
