import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

abstract class TodoRepository {
  Future<TodoEntity> create(TodoEntity todoModel);
  Future<List<TodoEntity>> findAll();
  Future<TodoEntity> findOne(int id);
  Future<TodoEntity> update(TodoEntity todo);
  Future<void> remove(int id);
}
