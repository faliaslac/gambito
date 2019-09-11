import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MOFA } from '../models/MOFA';
import { MOFAdetalle } from '../models/MOFAdetalle';

@Injectable({
  providedIn: 'root'
})

export class FacturasService {
  baseURL = environment.apiURL + 'TDMOFA/';
  baseURLDetalle = environment.apiURL + 'FacturasDetalle';

  constructor(private http: HttpClient) { }

  getMOFA(MOFAId: string): Observable<MOFA> {
    const url = this.baseURL + '5/?id=' + MOFAId;
    console.log ('Url: ' + url);
    return this.http.get<MOFA>(url);
  }

  getMOFAs(): Observable<MOFA[]> {
    return this.http.get<MOFA[]>(this.baseURL);
  }

  getMOFAsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }

  getMOFAsWithHeadersDetalle(): Observable<any> {
    return this.http.get(this.baseURLDetalle, {observe: 'response'});
  }


  createMOFA(mofa: MOFA): Observable<MOFA> {
    console.log(mofa);
    return this.http.post<MOFA>(this.baseURL, mofa);
  }

  updateMOFA(mofa: MOFA, id: number): Observable<MOFA> {
    const url = this.baseURL + id;
    return this.http.put<MOFA>(url, mofa);
  }


  deleteMOFA(id: number): Observable<any> {
    const url = this.baseURL + id;
    return this.http.delete(url);
  }
}

