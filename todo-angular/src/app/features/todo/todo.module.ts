import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TodoRoutingModule } from './todo.routing.module';
import { TodoComponent } from './todo.component';
import { TodoItemComponent } from './todo-item/todo-item.component';
import { TodoService } from './todo.service';



@NgModule({
  declarations: [TodoComponent, TodoItemComponent],
  imports: [
    CommonModule,
    TodoRoutingModule
  ],
  providers: [TodoService]
})
export class TodoModule { }
