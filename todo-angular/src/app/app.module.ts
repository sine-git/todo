import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TodoComponent } from './features/todo/todo.component';
import { HttpClientModule } from '@angular/common/http';
import { ApiService } from './services/api.ts.service';
import { TodoModalComponent } from './features/todo/todo-modal/todo-modal.component';

@NgModule({
  declarations: [
    AppComponent,
    TodoModalComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [ApiService],
  bootstrap: [AppComponent]
})
export class AppModule { }
