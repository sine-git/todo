import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TodoModule } from './features/todo/todo.module';

const routes: Routes = [
  {
    path: "todo",
    loadChildren: () => import('./features/todo/todo.module').then(() => TodoModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
