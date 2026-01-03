import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {


  constructor(private httpService: HttpClient) {
  }
  get<T>(url: string, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.get<T>(url, options)
  }
  post<T>(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.post<T>(url, body, options)
  }

  patch<T>(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.patch<T>(url, body, options)
  }

  put<T>(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.put<T>(url, body, options)
  }

  delete<T>(url: string, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.delete<T>(url, options)
  }
}
