import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "http://192.168.1.107:3000"; 

  Future<void> registerUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      print("Kayıt başarılı: ${response.body}");
    } else {
      print("Kayıt başarısız: ${response.body}");
    }
  }

  Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      print("Giriş başarılı: ${response.body}");
    } else {
      print("Giriş başarısız: ${response.body}");
    }
  }
}
