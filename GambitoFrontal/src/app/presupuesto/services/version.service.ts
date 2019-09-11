import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { VEPR } from '../models/VEPR';
import { VEPRampliado } from '../models/VEPRampliado';

@Injectable({
  providedIn: 'root'
})
export class VersionService {
  baseURL = environment.apiURL + 'TMVEPR/';
  baseURLampliado = environment.apiURL + 'VersionesPptoActivas/';

  constructor(private http: HttpClient) { }

  getVEPR(PAPRId: string): Observable<VEPR> {
    const url = this.baseURL + '5/?id=' + PAPRId;
    console.log ('Url: ' + url);
    return this.http.get<VEPR>(url);
  }

  getVEPRs(): Observable<VEPR[]> {
    return this.http.get<VEPR[]>(this.baseURL);
  }

  getVEPRsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }

  getVEPRsWithHeadersAmpliado(): Observable<any> {
    return this.http.get(this.baseURLampliado, {observe: 'response'});
  }


  createVEPR(vepr: VEPR): Observable<VEPR> {
    console.log(vepr);
    return this.http.post<VEPR>(this.baseURL, vepr);
  }

  updateVEPR(vepr: VEPR, id: number): Observable<VEPR> {
    const url = this.baseURL + id;
    return this.http.put<VEPR>(url, vepr);
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

