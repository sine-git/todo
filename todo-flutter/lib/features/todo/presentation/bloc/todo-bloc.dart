// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:todo_flutter/features/todo/domain/usecases/create-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/delete-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/find-all-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/find-one-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/update-todo.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-event.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo createTodo;
  final FindAllTodo findAllTodo;
  final FindOneTodo findOneTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.createTodo,
    required this.findAllTodo,
    required this.findOneTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodoInitialState()) {
    on<TodoFindAllEvent>(_findAllTodo);
    on<TodoFindOneEvent>(_findOneTodo);
    on<TodoCreateEvent>(_createTodo);
    on<TodoUpdateEvent>(_updateTodo);
    on<TodoDeleteEvent>(_deleteTodo);
  }

  FutureOr<void> _findAllTodo(
    TodoFindAllEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      emit(TodoLoadingState());
      final todos = await findAllTodo();
      emit(TodoLoadedState(todos: todos));
    } catch (e) {
      emit(TodoErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _createTodo(TodoCreateEvent event, Emitter<TodoState> emit) {
    try {} catch (e) {}
  }

  FutureOr<void> _updateTodo(TodoUpdateEvent event, Emitter<TodoState> emit) {
    try {} catch (e) {}
  }

  FutureOr<void> _findOneTodo(TodoFindOneEvent event, Emitter<TodoState> emit) {
    try {} catch (e) {}
  }

  FutureOr<void> _deleteTodo(TodoDeleteEvent event, Emitter<TodoState> emit) {
    try {} catch (e) {}
  }
}
