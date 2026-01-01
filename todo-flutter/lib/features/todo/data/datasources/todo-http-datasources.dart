// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:todo_flutter/cores/http/api.dart';
import 'package:todo_flutter/features/todo/data/datasources/todo-datasources.dart';
import 'package:todo_flutter/features/todo/data/models/todo-model.dart';

class TodoHttpDatasource implements TodoDataSources {
  final baseUrl = "http://192.168.233.223:3200";
  //final baseUrl = "http://127.0.0.1:3200";
  //final baseUrl = "https://jsonplaceholder.typicode.com";
  final Api api;
  TodoHttpDatasource({required this.api});

  @override
  Future<TodoModel> create(TodoModel todo) async {
    try {
      final body = jsonEncode(todo.toMap(withId: false));
      http.Response response = await api.post('${baseUrl}/todo', body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        TodoModel todoModel = TodoModel.fromMap(responseBody);
        return todoModel;
      }
      throw Exception(response.reasonPhrase);
    } catch (e, tr) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<TodoModel>> findAll() async {
    try {
      http.Response response = await api.get('${baseUrl}/todo');
      final code = response.statusCode;
      if (response.statusCode == 200) {
        List<dynamic> responseBody = jsonDecode(response.body);
        List<TodoModel> todos = responseBody
            .map((todo) => TodoModel.fromMap(todo))
            .toList();
        return todos;
      }
      throw Exception(response.reasonPhrase);
    } catch (e, tr) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<TodoModel> findOne(int id) async {
    try {
      http.Response response = await api.get('${baseUrl}/todo');
      print("Api call response : $response");
      if (response.statusCode == 200) {
        dynamic responseBody = jsonDecode(response.body);
        TodoModel todo = TodoModel.fromMap(responseBody);
        return todo;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> remove(int id) async {
    try {
      http.Response response = await api.delete('${baseUrl}/todo/${id}');
      print("Api call response : $response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return;
      }
      throw Exception(response.reasonPhrase);
    } catch (e, tr) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<TodoModel> update(TodoModel todo) async {
    try {
      final body = jsonEncode(todo.toMap(withId: false));
      http.Response response = await api.patch(
        '${baseUrl}/todo/${todo.id}',
        body,
      );
      final code = response.statusCode;
      //print("Api call response : $response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        TodoModel todo = TodoModel.fromMap(responseBody);
        return todo;
      }
      throw Exception(response.reasonPhrase);
    } catch (e, tr) {
      throw Exception(e.toString());
    }
  }
}
