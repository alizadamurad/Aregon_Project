import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConnect {
  Future<dynamic> login(String? email, String? password) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://www.motosikletci.com/api/oturum-test?email=$email&sifre=$password'),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return e.toString();
    }
  }
}
