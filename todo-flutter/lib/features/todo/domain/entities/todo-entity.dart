// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class TodoEntity {
  int id;
  int userId;
  String title;
  bool completed;
  TodoEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });
}
