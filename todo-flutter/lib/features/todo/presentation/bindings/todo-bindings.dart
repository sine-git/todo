import 'package:get/get.dart';
import 'package:todo_flutter/cores/http/api.dart';
import 'package:todo_flutter/features/todo/data/datasources/todo-datasources.dart';
import 'package:todo_flutter/features/todo/data/datasources/todo-http-datasources.dart';
import 'package:todo_flutter/features/todo/data/repositories/todo-repository-impl.dart';
import 'package:todo_flutter/features/todo/domain/repositories/todo-repository.dart';
import 'package:todo_flutter/features/todo/domain/usecases/create-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/delete-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/find-all-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/find-one-todo.dart';
import 'package:todo_flutter/features/todo/domain/usecases/update-todo.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-bloc.dart';

class TodoBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Api>(() => Api());
    Get.lazyPut<TodoDataSources>(() => TodoHttpDatasource(api: Get.find()));
    Get.lazyPut<TodoRepository>(
      () => TodoRepositoryImpl(todoDataSources: Get.find()),
    );
    Get.lazyPut<CreateTodo>(() => CreateTodo(todoRepository: Get.find()));
    Get.lazyPut<FindAllTodo>(() => FindAllTodo(todoRepository: Get.find()));
    Get.lazyPut<FindOneTodo>(() => FindOneTodo(todoRepository: Get.find()));
    Get.lazyPut<UpdateTodo>(() => UpdateTodo(todoRepository: Get.find()));
    Get.lazyPut<DeleteTodo>(() => DeleteTodo(todoRepository: Get.find()));

    Get.lazyPut<TodoBloc>(
      () => TodoBloc(
        createTodo: Get.find(),
        findAllTodo: Get.find(),
        findOneTodo: Get.find(),
        updateTodo: Get.find(),
        deleteTodo: Get.find(),
      ),
    );
  }
}
