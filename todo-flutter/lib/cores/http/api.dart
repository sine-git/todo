import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  Future<Response> get(String url, {Map<String, String>? headers}) {
    return http.get(Uri.parse(url), headers: headers);
  }

  Future<Response> post(
    String url,
    Object? body, {
    Map<String, String>? headers,
    Encoding? encoding,
  }) {
    return http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<Response> put(
    String url,
    Object body, {
    Map<String, String>? headers,
    Encoding? encoding,
  }) {
    return http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return http.delete(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}
