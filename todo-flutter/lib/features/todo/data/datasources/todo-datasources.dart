import 'package:todo_flutter/features/todo/data/models/todo-model.dart';

abstract class TodoDataSources {
  Future<TodoModel> create(TodoModel todoModel);
  Future<List<TodoModel>> findAll();
  Future<TodoModel> findOne(int id);
  Future<TodoModel> update(TodoModel todo);
  Future<void> remove(int id);
}
