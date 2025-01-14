import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<http.Response> post(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(const Duration(seconds: 15), onTimeout: () {
        throw TimeoutException('The connection has timed out');
      });

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Request failed with status: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      throw Exception('Failed to make the request: $e');
    }
  }

  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(
        url,
        headers: headers ?? {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 15), onTimeout: () {
        throw TimeoutException('The connection has timed out');
      });

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Request failed with status: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      throw Exception('Failed to make the request: $e');
    }
  }
}
