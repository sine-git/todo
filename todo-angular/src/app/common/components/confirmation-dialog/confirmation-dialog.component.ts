import { Component, inject } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { ConfirmationDialogService } from '../../services/confirmation-dialog.service';

@Component({
  selector: 'app-confirmation-dialog',
  templateUrl: './confirmation-dialog.component.html',
  styleUrls: ['./confirmation-dialog.component.scss'],

})
export class ConfirmationDialogComponent {
  readonly dialogRef = inject(MatDialogRef<ConfirmationDialogComponent>)
  confirm() {
    this.dialogRef.close(true)
  }
  cancel() {
    this.dialogRef.close()
  }

}
