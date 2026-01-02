import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-todo-item',
  templateUrl: './todo-item.component.html',
  styleUrls: ['./todo-item.component.scss'],
  imports: [CommonModule],
  standalone: true
})
export class TodoItemComponent {
  @Input('state')
  state: boolean = false;
  @Input()
  userId?: string;
  @Input('title')
  title?: string;

}
