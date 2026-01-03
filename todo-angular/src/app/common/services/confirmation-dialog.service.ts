import { inject, Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmationDialogComponent } from '../components/confirmation-dialog/confirmation-dialog.component';
import { firstValueFrom } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ConfirmationDialogService {

  readonly dialog = inject(MatDialog);
  async showDialog(message: string) {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, { data: message })
    return await firstValueFrom(dialogRef.afterClosed())
  }
}
