import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {


  constructor(private httpService: HttpClient) {
  }
  get(url: string, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.get(url, options)
  }
  post(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.post(url, body, options)
  }

  patch(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.patch(url, body, options)
  }

  put(url: string, body: any, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.put(url, body, options)
  }

  delete(url: string, options?: {
    headers?: HttpHeaders | {
      [header: string]: string | string[];
    } | undefined
  }): Observable<any> {
    return this.httpService.delete(url, options)
  }
}
