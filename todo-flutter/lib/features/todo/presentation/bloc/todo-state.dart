// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class TodoErrorState extends TodoState {
  final String message;
  TodoErrorState({required this.message});
}

class TodoActionSuccessState extends TodoState {
  final String message;

  TodoActionSuccessState({required this.message});
}

class TodoActionErrorState extends TodoState {
  final String message;
  TodoActionErrorState({required this.message});
}
