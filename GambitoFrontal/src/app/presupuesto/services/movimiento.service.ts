import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MOPR } from '../models/MOPR';
// import { VEPRampliado } from '../models/VEPRampliado';

@Injectable({
  providedIn: 'root'
})

export class MovimientoService {
  baseURL = environment.apiURL + 'TDMOPR/';

  constructor(private http: HttpClient) { }

  getMOPR(MOPRId: string): Observable<MOPR> {
    const url = this.baseURL + '5/?id=' + MOPRId;
    console.log ('Url: ' + url);
    return this.http.get<MOPR>(url);
  }

  getMOPRs(): Observable<MOPR[]> {
    return this.http.get<MOPR[]>(this.baseURL);
  }

  getMOPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }

  /* getMOPRsWithHeadersAmpliado(): Observable<any> {
    return this.http.get(this.baseURLampliado, {observe: 'response'});
  } */


  createMOPR(mopr: MOPR): Observable<MOPR> {
    console.log(mopr);
    return this.http.post<MOPR>(this.baseURL, mopr);
  }

  updateMOPR(mopr: MOPR, id: number): Observable<MOPR> {
    const url = this.baseURL + id;
    return this.http.put<MOPR>(url, mopr);
  }

  /*patchUser(id: number, operations: Operation[]){
    const url = this.baseURL + id;
    return this.http.patch(url, operations);
  }

  deleteUser(id: number): Observable<any> {
    const url = this.baseURL + id;
    return this.http.delete(url);
  } */
}

