import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { PAPR } from '../models/PAPR';

@Injectable({
  providedIn: 'root'
})
export class TPPAPRService {
  baseURL = environment.apiURL + 'TPPAPR/';
  constructor(private http: HttpClient) { }

  getPAPR(PAPRId: string): Observable<PAPR> {
    const url = this.baseURL + '5/?id=' + PAPRId;
    console.log ('Url: ' + url);
    return this.http.get<PAPR>(url);
  }

  getPAPRs(): Observable<PAPR[]> {
    return this.http.get<PAPR[]>(this.baseURL);
  }

  getPAPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}


