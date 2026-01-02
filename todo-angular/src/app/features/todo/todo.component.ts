import { ChangeDetectionStrategy, Component, inject, OnInit } from '@angular/core';
import { TodoService } from './todo.service';
import { firstValueFrom } from 'rxjs';
import { TodoModel } from './todo.model';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';
import { TodoItemComponent } from './todo-item/todo-item.component';
import { TodoModalComponent } from './todo-modal/todo-modal.component';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.scss'],
  imports: [CommonModule, MatDialogModule, TodoItemComponent],
  //changeDetection: ChangeDetectionStrategy.OnPush,
  standalone: true
})
export class TodoComponent implements OnInit {

  readonly dialog = inject(MatDialog);
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

  openDialog() {
    const dialogRef = this.dialog.open(TodoModalComponent, {})
  }
}
