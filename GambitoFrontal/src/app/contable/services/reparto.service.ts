import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { BATCALC } from '../models/BATCALC';

// ************
// Servicio para interactuar con la API BI_BATCALC
// ************

@Injectable({
  providedIn: 'root'
})

export class RepartoService {
  baseURL = environment.apiURL + 'BI_BATCALC/';
  baseURLDetalle = environment.apiURL + 'FacturasDetalle';

  constructor(private http: HttpClient) { }

  getBATCALC(BATCALCId: string): Observable<BATCALC> {
    const url = this.baseURL + '5/?id=' + BATCALCId;
    console.log ('Url: ' + url);
    return this.http.get<BATCALC>(url);
  }

  getBATCALCs(): Observable<BATCALC[]> {
    return this.http.get<BATCALC[]>(this.baseURL);
  }

  getBATCALCsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }

  getBATCALCsWithHeadersDetalle(): Observable<any> {
    return this.http.get(this.baseURLDetalle, {observe: 'response'});
  }


  createBATCALC(batcalc: BATCALC): Observable<BATCALC> {
    console.log(batcalc);
    return this.http.post<BATCALC>(this.baseURL, batcalc);
  }

  updateBATCALC(batcalc: BATCALC, id: number): Observable<BATCALC> {
    const url = this.baseURL + id;
    return this.http.put<BATCALC>(url, batcalc);
  }


  deleteBATCALC(id: number): Observable<any> {
    const url = this.baseURL + id;
    return this.http.delete(url);
  }
}
