import { Injectable } from '@angular/core';
import { ApiService } from 'src/app/common/services/api.ts.service';
import { TodoModel } from './todo.model';
import { first, firstValueFrom, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TodoService {

  baseUrl = "http://192.168.1.3:3200"
  constructor(private api: ApiService) {
  }

  create(todo: TodoModel): Observable<TodoModel> {

    return this.api.post(`${this.baseUrl}/todo`, todo);
  }

  findAll(): Observable<TodoModel[]> {
    return this.api.get<TodoModel[]>(`${this.baseUrl}/todo`);
  }

  findOne(id: number): Observable<TodoModel> {
    return this.api.get(`${this.baseUrl}/todo/${id}`);
  }

  remove(id: number): Observable<void> {
    return this.api.delete(`${this.baseUrl}/todo/${id}`);
  }

  update(id: number, todo: TodoModel): Observable<TodoModel> {

    return this.api.patch(
      `${this.baseUrl}/todo/${id}`,
      todo,
    )
  }


}
