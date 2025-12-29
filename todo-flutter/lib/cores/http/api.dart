import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    return await http
        .get(Uri.parse(url), headers: headers)
        .timeout(Duration(seconds: 10));
  }

  Future<http.Response> post(
    String url,
    Object? body, {
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> put(
    String url,
    Object body, {
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    return await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return await http.delete(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}
