import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CursosService {

  endPoint = 'http://localhost:8000/api/cursos';

  constructor(private http: HttpClient) {
  }
  public getList(): Observable<any> {
    return this.http.get<any>(`${this.endPoint}`);
  }
  public getById(cursos_id): Observable<any> {
    return this.http.get<any>(`${this.endPoint}/${cursos_id}`);
  }
  public add(data): Observable<any> {
    return this.http.post<any>(`${this.endPoint}`, data);
  }
  public update(cursos_id, data): Observable<any> {
    return this.http.put<any>(`${this.endPoint}/${cursos_id}`, data);
  }
  public delete(cursos_id): Observable<any> {
    console.log(`${this.endPoint}/${cursos_id}` );
    return this.http.delete<any>(`${this.endPoint}/${cursos_id}`);
  }
}
