import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TodoComponent } from './features/todo/todo.component';
import { HttpClientModule } from '@angular/common/http';
import { ApiService } from './common/services/api.ts.service';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ConfirmationDialogComponent } from './common/components/confirmation-dialog/confirmation-dialog.component';
import { LoaderComponent } from './common/components/loader/loader.component';
import { MatDialogModule } from '@angular/material/dialog';

@NgModule({
  declarations: [
    AppComponent,
    LoaderComponent,
    ConfirmationDialogComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    MatProgressSpinnerModule,
    MatDialogModule

  ],
  providers: [ApiService, MatSnackBar],
  bootstrap: [AppComponent]
})
export class AppModule { }
