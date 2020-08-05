import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LogindatosService {

  private baseUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) { }

  signup(data) {
    return this.http.post(`${this.baseUrl}/signup`, data)
  }

  login(data) {
    return this.http.post(`${this.baseUrl}/login`, data)
  }

  sendPasswordResetLink(data) {
    return this.http.post(`${this.baseUrl}/sendPasswordResetLink`, data)
  }
  
  changePassword(data) {
    return this.http.post(`${this.baseUrl}/resetPassword`, data)
  }
  datos(data) {
    return this.http.get(`${this.baseUrl}/usuario`,{ headers:{
      'Authorization': "Bearer " + data,
      }
    })
  }
  usuarios(data) {
    return this.http.get(`${this.baseUrl}/users`,{ headers:{
      'Authorization': "Bearer " + data,
      }
    })
  }

  profile(data){
    const headers = new HttpHeaders();
    headers.append('Content-Type', 'multipart/form-data');
    headers.append('Accept', 'application/json');
    console.log(data)
    this.http.post(`${this.baseUrl}/image`, data, {headers: headers}).subscribe(response=>{
      console.log(response)
    })
  }
}
