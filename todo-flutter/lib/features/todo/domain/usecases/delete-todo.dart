import 'package:get/get.dart';
import 'package:todo_flutter/features/todo/data/repositories/todo-repository-impl.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';

class DeleteTodo {
  final TodoRepository todoRepository;

  DeleteTodo({required this.todoRepository});

  call(int id) {
    return todoRepository.findOne(id);
  }
}
