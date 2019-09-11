import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { NIPR } from '../models/NIPR';

@Injectable({
  providedIn: 'root'
})
export class TPNIPRService {
  baseURL = environment.apiURL + 'TPNIPR/';
  constructor(private http: HttpClient) { }

  getNIPR(NIPRId: string): Observable<NIPR> {
    const url = this.baseURL + '5/?id=' + NIPRId;
    console.log ('Url: ' + url);
    return this.http.get<NIPR>(url);
  }

  getNIPRs(): Observable<NIPR[]> {
    return this.http.get<NIPR[]>(this.baseURL);
  }

  getNIPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}


