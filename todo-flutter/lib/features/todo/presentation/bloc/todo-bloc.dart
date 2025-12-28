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
  final CreateTodo createTodo = Get.find<CreateTodo>();
  final FindAllTodo findAllTodo = Get.find<FindAllTodo>();
  final FindOneTodo findOneTodo = Get.find<FindOneTodo>();
  final UpdateTodo updateTodo = Get.find<UpdateTodo>();
  final DeleteTodo deleteTodo = Get.find<DeleteTodo>();

  TodoBloc() : super(TodoInitialState()) {
    on<TodoFindAllEvent>(_findAllTodo);
    on<TodoFindOneEvent>(_findOneTodo);
    on<TodoCreateEvent>(_createTodo);
    on<TodoUpdateEvent>(_updateTodo);
    on<TodoDeleteEvent>(_deleteTodo);
  }

  FutureOr<void> _findAllTodo(TodoFindAllEvent event, Emitter<TodoState> emit) {
    try {
      final todos = findAllTodo();
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
