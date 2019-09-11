import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TIPR } from '../models/TIPR';

@Injectable({
  providedIn: 'root'
})
export class TPTIPRService {
  baseURL = environment.apiURL + 'TPTIPR/';
  constructor(private http: HttpClient) { }

  getTIPR(TIPRId: string): Observable<TIPR> {
    const url = this.baseURL + '5/?id=' + TIPRId;
    console.log ('Url: ' + url);
    return this.http.get<TIPR>(url);
  }

  getTIPRs(): Observable<TIPR[]> {
    return this.http.get<TIPR[]>(this.baseURL);
  }

  getTIPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}


