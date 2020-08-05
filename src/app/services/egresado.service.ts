import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EgresadoService {

  endPoint = 'http://localhost:8000/api/egresado';

  constructor(private http: HttpClient) {
  }
  public getList(): Observable<any> {
    return this.http.get<any>(`${this.endPoint}`);
  }
  public getById(egresado_id): Observable<any> {
    return this.http.get<any>(`${this.endPoint}/${egresado_id}`);
  }
  public add(data): Observable<any> {
    return this.http.post<any>(`${this.endPoint}`, data);
  }
  public update(egresado_id, data): Observable<any> {
    return this.http.put<any>(`${this.endPoint}/${egresado_id}`, data);
  }
  public delete(egresado_id): Observable<any> {
    console.log(`${this.endPoint}/${egresado_id}` );
    return this.http.delete<any>(`${this.endPoint}/${egresado_id}`);
  }
}
