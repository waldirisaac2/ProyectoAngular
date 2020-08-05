import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DetalleService {

  endPoint = 'http://localhost:8000/api/detalle';

  constructor(private http: HttpClient) {
  }
  public getList(): Observable<any> {
    return this.http.get<any>(`${this.endPoint}`);
  }
  public getById(detalle_id): Observable<any> {
    return this.http.get<any>(`${this.endPoint}/${detalle_id}`);
  }
  public add(data): Observable<any> {
    return this.http.post<any>(`${this.endPoint}`, data);
  }
  public update(detalle_id, data): Observable<any> {
    return this.http.put<any>(`${this.endPoint}/${detalle_id}`, data);
  }
  public delete(detalle_id): Observable<any> {
    console.log(`${this.endPoint}/${detalle_id}` );
    return this.http.delete<any>(`${this.endPoint}/${detalle_id}`);
  }
}
