import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmpresaService {
  
  endPoint = 'http://localhost:8000/api/empresa';

  constructor(private http: HttpClient) {
  }
  public getList(): Observable<any> {
    return this.http.get<any>(`${this.endPoint}`);
  }
  public getById(empresa_id): Observable<any> {
    return this.http.get<any>(`${this.endPoint}/${empresa_id}`);
  }
  public getByIdeg(egresado_id): Observable<any> {
    return this.http.get<any>(`${this.endPoint}/${egresado_id}`);
  }
  public add(data): Observable<any> {
    return this.http.post<any>(`${this.endPoint}`, data);
  }
  public update(empresa_id, data): Observable<any> {
    return this.http.put<any>(`${this.endPoint}/${empresa_id}`, data);
  }
  public delete(empresa_id): Observable<any> {
    console.log(`${this.endPoint}/${empresa_id}` );
    return this.http.delete<any>(`${this.endPoint}/${empresa_id}`);
  }
}
