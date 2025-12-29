import 'package:get/get.dart';
import 'package:todo_flutter/features/todo/data/datasources/todo-datasources.dart';
import 'package:todo_flutter/features/todo/data/datasources/todo-http-datasources.dart';
import 'package:todo_flutter/features/todo/data/models/todo-model.dart';
import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSources todoDataSources;

  TodoRepositoryImpl({required this.todoDataSources});
  @override
  Future<TodoEntity> create(TodoEntity todo) {
    return todoDataSources.create(TodoModel.fromEntity(todo));
  }

  @override
  Future<List<TodoEntity>> findAll() {
    return todoDataSources.findAll();
  }

  @override
  Future<TodoEntity> findOne(int id) {
    return todoDataSources.findOne(id);
  }

  @override
  Future<void> remove(int id) {
    return todoDataSources.remove(id);
  }

  @override
  Future<TodoEntity> update(TodoEntity todo) {
    return todoDataSources.update(TodoModel.fromEntity(todo));
  }
}
