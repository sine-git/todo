import 'package:get/get.dart';
import 'package:todo_flutter/features/todo/data/repositories/todo-repository-impl.dart';
import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';

class UpdateTodo {
  final TodoRepository todoRepository;
  UpdateTodo({required this.todoRepository});
  call(TodoEntity todo) {
    return todoRepository.update(todo);
  }
}
