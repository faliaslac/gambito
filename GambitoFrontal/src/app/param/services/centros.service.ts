import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Centro } from '../models/CENTRO';

@Injectable({
  providedIn: 'root'
})
export class CentroService {
  baseURL = environment.apiURL + 'TMCENTROS/';
  constructor(private http: HttpClient) { }

  getCentro(CentroId: string): Observable<Centro> {
    const url = this.baseURL + '5/?id=' + CentroId;
    console.log ('Url: ' + url);
    return this.http.get<Centro>(url);
  }

  getCentros(): Observable<Centro[]> {
    return this.http.get<Centro[]>(this.baseURL);
  }

  getCentrosWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}

