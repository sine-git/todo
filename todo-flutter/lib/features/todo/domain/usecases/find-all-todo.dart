import 'package:get/get.dart';
import 'package:todo_flutter/features/todo/data/repositories/todo-repository-impl.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';

class FindAllTodo {
  final TodoRepository todoRepository;

  FindAllTodo({required this.todoRepository});

  call() {
    return todoRepository.findAll();
  }
}
