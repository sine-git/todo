// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  List<TodoEntity> todos;
  TodoLoadedState({required this.todos});
}

class TodoErrorState extends TodoState {
  final String message;
  TodoErrorState({required this.message});
}

class TodoSuccessState extends TodoState {
  final String message;

  TodoSuccessState({required this.message});
}
