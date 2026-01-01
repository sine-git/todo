// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_flutter/cores/mixins/action-state.dart';
import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoActionLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  List<TodoEntity> todos;
  TodoLoadedState({required this.todos});
}

class TodoOneLoadedState extends TodoState {
  TodoEntity todo;
  TodoOneLoadedState({required this.todo});
}

class TodoErrorState extends TodoState with ActionState {
  TodoErrorState();
}

class TodoActionSuccessState extends TodoState with ActionState {
  //final String message;

  TodoActionSuccessState();
}

class TodoActionErrorState extends TodoState with ActionState {
  TodoActionErrorState();
}
