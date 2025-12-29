// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:todo_flutter/features/todo/data/repositories/todo-repository-impl.dart';
import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';

class CreateTodo {
  final TodoRepository todoRepository;
  CreateTodo({required this.todoRepository});
  call(TodoEntity todo) {
    return todoRepository.create(todo);
  }
}
