import { Component, inject } from '@angular/core';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MAT_DIALOG_DATA, MatDialogActions, MatDialogClose, MatDialogContent, MatDialogModule, MatDialogRef, MatDialogTitle, } from '@angular/material/dialog';
import { TodoModel } from '../todo.model';
import { TodoService } from '../todo.service';
import { firstValueFrom } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LoaderService } from 'src/app/common/services/loader.service';
import { HttpErrorResponse } from '@angular/common/http';
import { SnackBarService } from 'src/app/common/services/snack-bar.service';
@Component({
  selector: 'app-todo-modal',
  templateUrl: './todo-modal.component.html',
  styleUrls: ['./todo-modal.component.scss'],
  standalone: true,
  imports: [FormsModule, ReactiveFormsModule, MatButtonModule, MatFormFieldModule, MatInputModule, MatDialogModule, MatCheckboxModule],
})
export class TodoModalComponent {
  title: string = "Create todo";
  readonly dialogRef = inject(MatDialogRef<TodoModalComponent>)
  readonly data = inject<TodoModel>(MAT_DIALOG_DATA)
  readonly formBuilder = inject(FormBuilder)
  readonly todoService = inject(TodoService)
  readonly snackBarService = inject(SnackBarService)
  readonly loader = inject(LoaderService)
  todoForm = this.formBuilder.group({
    'id': [this.data?.id],
    'title': [this.data?.title ?? '', [Validators.required]],
    'userId': [this.data?.userId ?? null, [Validators.required]],
    'completed': [this.data?.completed ?? false, [Validators.required]]
  })

  async save() {

    try {
      this.loader.show()
      if (this.todoForm.valid) {

        const todo: TodoModel = {
          //id: this.todoForm.value.id!,
          title: this.todoForm.value.title!,
          userId: Number(this.todoForm.value!.userId!),
          completed: this.todoForm.value.completed!,
        }
        const response = await firstValueFrom(
          this.data?.id ?
            this.todoService.update(this.data?.id, todo) : this.todoService.create(todo));
        const message = this.data?.id ? 'Todo successfully updated ' : 'Todo successfully created '
        this.snackBarService.successMessage(message
        )
        this.dialogRef.close(response)
        console.log()
        this.loader.hide()
      }
    }
    catch (e) {
      this.snackBarService.errorMessage('An error occured ')
    }
    finally {
      this.loader.hide()
    }

  }

  cancel() {
    this.dialogRef.close()
  }

}
