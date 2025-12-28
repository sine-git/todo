import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

abstract class TodoEvent {}

class TodoFindAllEvent extends TodoEvent {}

class TodoFindOneEvent extends TodoEvent {
  final int id;
  TodoFindOneEvent({required this.id});
}

class TodoCreateEvent extends TodoEvent {
  final TodoEntity todoEntity;
  TodoCreateEvent({required this.todoEntity});
}

class TodoUpdateEvent extends TodoEvent {
  final TodoEntity todoEntity;
  TodoUpdateEvent({required this.todoEntity});
}

class TodoDeleteEvent extends TodoEvent {
  final int id;
  TodoDeleteEvent({required this.id});
}
