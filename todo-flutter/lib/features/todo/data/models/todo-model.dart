import 'dart:convert';

import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  Map<String, dynamic> toMap({bool withId = true}) {
    return withId
        ? <String, dynamic>{
            'id': id,
            'userId': userId,
            'title': title,
            'completed': completed,
          }
        : <String, dynamic>{
            'userId': userId,
            'title': title,
            'completed': completed,
          };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      completed: entity.completed,
      userId: entity.userId,
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      completed: completed,
      userId: userId,
    );
  }

  String toJson({bool withId = false}) => json.encode(toMap(withId: withId));

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
