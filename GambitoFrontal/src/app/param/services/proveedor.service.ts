import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { PROV } from '../models/proveedor';

@Injectable({
  providedIn: 'root'
})
export class ProveedorService {
  baseURL = environment.apiURL + 'TMPROVEEDOR/';
  constructor(private http: HttpClient) { }

  getPROV(PROVId: string): Observable<PROV> {
    const url = this.baseURL + '5/?id=' + PROVId;
    return this.http.get<PROV>(url);
  }

  getPROVs(): Observable<PROV[]> {
    return this.http.get<PROV[]>(this.baseURL);
  }

  getPROVsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }

  createPROV(prov: PROV): Observable<PROV> {
  return this.http.post<PROV>(this.baseURL, prov);
  }

  updateMOFA(prov: PROV, id: number): Observable<PROV> {
    const url = this.baseURL + id;
    return this.http.put<PROV>(url, prov);
  }


  deleteMOFA(id: number): Observable<any> {
    const url = this.baseURL + id;
    return this.http.delete(url);
  }

}


