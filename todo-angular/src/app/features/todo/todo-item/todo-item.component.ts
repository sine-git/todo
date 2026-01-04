import { CommonModule } from '@angular/common';
import { Component, EventEmitter, inject, Input, Output } from '@angular/core';
import { ConfirmationDialogService } from 'src/app/common/services/confirmation-dialog.service';
import { LoaderService } from 'src/app/common/services/loader.service';
import { SnackBarService } from 'src/app/common/services/snack-bar.service';
import { TodoService } from '../todo.service';
import { MatDialog } from '@angular/material/dialog';
import { firstValueFrom } from 'rxjs';
import { TodoModel } from '../todo.model';
import { TodoModalComponent } from '../todo-modal/todo-modal.component';

@Component({
  selector: 'app-todo-item',
  templateUrl: './todo-item.component.html',
  styleUrls: ['./todo-item.component.scss'],
  imports: [CommonModule],
  standalone: true
})
export class TodoItemComponent {
  @Input('todo')
  todo?: TodoModel
  @Output()
  onDetails = new EventEmitter<TodoModel>()
  @Output()
  onDelete = new EventEmitter<number>()

  readonly snackBarService = inject(SnackBarService)
  readonly loader = inject(LoaderService)
  readonly confirmationService = inject(ConfirmationDialogService)
  readonly dialog = inject(MatDialog);
  readonly todoService = inject(TodoService)

  openDetails(todo?: TodoModel) {
    this.onDetails.emit(todo)
  }

  deleteTodo() {
    this.onDelete.emit(this.todo?.id)
  }

}
