import { Component, OnInit } from '@angular/core';
import { TodoService } from './todo.service';
import { firstValueFrom } from 'rxjs';
import { TodoModel } from './todo.model';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.scss'],
})
export class TodoComponent implements OnInit {

  todoList: TodoModel[] = [];
  constructor(private todoService: TodoService) {
  }
  ngOnInit(): void {
    this.findAll()
  }

  async findAll() {
    try {
      const response = await firstValueFrom(this.todoService.findAll())
      const list = response.map((item) => new TodoModel(item.id, item.userId, item.title, item.completed));

      this.todoList = list
    }
    catch (e) {
      console.log(e)
    }
  }
}
