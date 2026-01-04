import { ChangeDetectionStrategy, Component, inject, OnInit } from '@angular/core';
import { TodoService } from './todo.service';
import { firstValueFrom } from 'rxjs';
import { TodoModel } from './todo.model';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';
import { TodoItemComponent } from './todo-item/todo-item.component';
import { TodoModalComponent } from './todo-modal/todo-modal.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LoaderService } from 'src/app/common/services/loader.service';
import { SnackBarService } from 'src/app/common/services/snack-bar.service';
import { ConfirmationDialogService } from 'src/app/common/services/confirmation-dialog.service';

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
  readonly todoService = inject(TodoService)
  readonly snackBarService = inject(SnackBarService)
  readonly loader = inject(LoaderService)
  readonly confirmationService = inject(ConfirmationDialogService)
  showError = false;
  todoList: TodoModel[] = [];
  constructor() {
  }
  ngOnInit(): void {
    this.findAll()
  }

  async findAll() {
    try {
      this.loader.show()
      const response = await firstValueFrom(this.todoService.findAll())
      const list = response.map((item) => new TodoModel(item.id, item.userId, item.title, item.completed));

      this.todoList = list
      this.loader.hide()
      this.showError = false
    }
    catch (e) {
      this.loader.hide()
      this.showError = true
    }
    finally {
      this.loader.hide()
    }
  }

  async delete(id: number) {
    try {
      const confirmationResult = await this.confirmationService.showDialog("Do you really want to delete this todo? ");
      if (!confirmationResult)
        return
      this.loader.show()
      await firstValueFrom(this.todoService.remove(id))
      this.snackBarService.successMessage('Todo successfully deleted ')
      this.loader.hide()
      this.findAll()
    }
    catch (e) {
      this.snackBarService.errorMessage('An error occured ')
      this.loader.hide()

    }
  }


  openDialog(todo?: TodoModel) {
    const dialogRef = this.dialog.open(TodoModalComponent, { width: '400px', data: todo })
    dialogRef.afterClosed().subscribe((todo) => {

      if (todo)
        this.findAll();
    })
  }

}
