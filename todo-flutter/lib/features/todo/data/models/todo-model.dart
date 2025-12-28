import 'dart:convert';

import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
