import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { VEPR } from '../models/VEPR';

@Injectable({
  providedIn: 'root'
})
export class TPVEPRService {
  baseURL = environment.apiURL + 'TPTIPR/';
  constructor(private http: HttpClient) { }

  getVEPR(VEPRId: string): Observable<VEPR> {
    const url = this.baseURL + '5/?id=' + VEPRId;
    console.log ('Url: ' + url);
    return this.http.get<VEPR>(url);
  }

  getVEPRs(): Observable<VEPR[]> {
    return this.http.get<VEPR[]>(this.baseURL);
  }

  getVEPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}
