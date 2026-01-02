import { Component, inject } from '@angular/core';
import { FormBuilder, FormsModule, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MAT_DIALOG_DATA, MatDialogActions, MatDialogClose, MatDialogContent, MatDialogModule, MatDialogRef, MatDialogTitle } from '@angular/material/dialog';
import { TodoModel } from '../todo.model';
@Component({
  selector: 'app-todo-modal',
  templateUrl: './todo-modal.component.html',
  styleUrls: ['./todo-modal.component.scss'],
  standalone: true,
  imports: [FormsModule, MatButtonModule, MatFormFieldModule, MatInputModule, MatDialogModule]
})
export class TodoModalComponent {
  title: string = "Create todo";
  readonly dialogRef = inject(MatDialogRef<TodoModalComponent>);
  readonly data = inject<TodoModel>(MAT_DIALOG_DATA);
  readonly formBuilder = inject(FormBuilder)

  todoForm = this.formBuilder.group({
    'title': ['', [Validators.required]],
    'userId': ['', [Validators.required]],
    'completed': [false, [Validators.required]]
  })

  constructor() {

  }


  save() {
    const todo = this.todoForm.value
  }

  cancel() {
    this.dialogRef.close()
  }

}
