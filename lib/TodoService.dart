import 'package:http/http.dart' as http;
import 'Todo.dart';
import 'dart:convert';

//json의 여러 데이터 중 의자만 불러왔습니다.


class TodoService {
  static const baseUrl = 'http://localhost:3000';
  static const headers = {'Content-Type': 'application/json'};

  // GET /todos
  static Future<List<Products>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/chairs'));

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 200) {
      // HTTP 응답 결과로부터 JSON 리스트를 파싱하여 Todo 리스트로 변환합니다.
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((json) => Products.fromJson(json)).toList();
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to load Products');
    }
  }

  // POST /todos
  static Future<Products> createTodo(Products todo) async {
    // Todo 객체를 JSON 형식으로 변환합니다.
    final jsonBody = jsonEncode(todo.toJson());

    // HTTP POST 요청을 보내서 새로운 Todo 항목을 생성합니다.
    final response = await http.post(
      Uri.parse('$baseUrl/chairs'),
      headers: headers,
      body: jsonBody,
    );

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 201) {
      // HTTP 응답 결과로부터 생성된 Todo 객체를 파싱하여 반환합니다.
      final json = jsonDecode(response.body);
      return Products.fromJson(json);
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to create Products');
    }
  }

  // PUT /todos/:id
  static Future<Products> updateTodo(Products todo) async {
    // Todo 객체를 JSON 형식으로 변환합니다.
    final jsonBody = jsonEncode(todo.toJson());

    // HTTP PUT 요청을 보내서 Todo 항목을 수정합니다.
    final response = await http.put(
      Uri.parse('$baseUrl/chairs/${todo.id}'),
      headers: headers,
      body: jsonBody,
    );

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode == 200) {
      // HTTP 응답 결과로부터 수정된 Todo 객체를 파싱하여 반환합니다.
      final json = jsonDecode(response.body);
      return Products.fromJson(json);
    } else {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to update Products');
    }
  }

  // DELETE /todos/:id
  static Future<void> deleteTodo(int id) async {
    // HTTP DELETE 요청을 보내서 Todo 항목을 삭제합니다.
    final response = await http.delete(Uri.parse('$baseUrl/chairs/$id'));

    // HTTP 요청이 성공적으로 완료되었는지 확인합니다.
    if (response.statusCode != 204) {
      // HTTP 요청이 실패한 경우 예외를 던집니다.
      throw Exception('Failed to delete Products');
    }
  }
}


