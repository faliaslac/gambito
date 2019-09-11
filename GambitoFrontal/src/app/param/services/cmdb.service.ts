import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CMDB } from '../models/CMDB';

@Injectable({
  providedIn: 'root'
})
export class CMDBService {
  baseURL = environment.apiURL + 'CMDB/';
  constructor(private http: HttpClient) { }

  getCMDB(CMDBId: string): Observable<CMDB> {
    const url = this.baseURL + '5/?id=' + CMDBId;
    console.log ('Url: ' + url);
    return this.http.get<CMDB>(url);
  }

  getCMDBs(): Observable<CMDB[]> {
    return this.http.get<CMDB[]>(this.baseURL);
  }

  getCMDBsWithHeaders(): Observable<any> {
    return this.http.get(this.baseURL, {observe: 'response'});
  }
}

