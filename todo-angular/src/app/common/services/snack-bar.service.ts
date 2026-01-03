import { inject, Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';

@Injectable({
  providedIn: 'root'
})
export class SnackBarService {
  readonly snackBar = inject(MatSnackBar)

  successMessage(message: string) {
    this.snackBar.open(message, 'Close', {
      duration: 10000,               // durée en ms
      horizontalPosition: 'center', // start | center | end | left | right
      verticalPosition: 'top',
      panelClass: ['snackbar-success']
    })
  }

  errorMessage(message: string) {
    this.snackBar.open(message, 'Close', {
      duration: 10000,               // durée en ms
      horizontalPosition: 'center', // start | center | end | left | right
      verticalPosition: 'top',
      panelClass: ['snackbar-error']

    })
  }

  infoMessage(message: string) {
    this.snackBar.open(message, 'Close', {
      duration: 10000,               // durée en ms
      horizontalPosition: 'center', // start | center | end | left | right
      verticalPosition: 'top',
      panelClass: ['snackbar-info']
    })
  }

  warningMessage(message: string) {
    this.snackBar.open(message, 'CLose', {
      duration: 10000,               // durée en ms
      horizontalPosition: 'center', // start | center | end | left | right
      verticalPosition: 'top',
      panelClass: ['snackbar-warning']
    })
  }
}
