import { Injectable } from '@angular/core';
import { ApiService } from 'src/app/services/api.ts.service';
import { TodoModel } from './todo.model';
import { first, firstValueFrom, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TodoService {

  baseUrl = "http://192.168.1.3:3200"
  constructor(private api: ApiService) {
  }

  async create(todo: TodoModel): Promise<TodoModel> {
    try {
      const response = await firstValueFrom(this.api.post(`${this.baseUrl}/todo`, todo));
      return response
    } catch (e) {
      throw e
    }
  }

  findAll(): Observable<TodoModel[]> {
    return this.api.get<TodoModel[]>(`${this.baseUrl}/todo`);
  }

  async findOne(id: number): Promise<TodoModel> {
    try {
      const response = await firstValueFrom(this.api.get(`${this.baseUrl}/todo/${id}`));
      return response;
    } catch (e) {
      throw e
    }
  }

  async remove(id: number): Promise<void> {
    try {
      await this.api.delete('${baseUrl}/todo/${id}');
      //print("Api call response : $response");    
    } catch (e) {
      throw e;
    }
  }

  async update(todo: TodoModel): Promise<TodoModel> {
    try {
      const response = await firstValueFrom(this.api.patch(
        `${this.baseUrl}/todo/${todo.id}`,
        todo,
      ))
      return todo;
    }
    catch (e) {
      throw e;
    }
  }

}
