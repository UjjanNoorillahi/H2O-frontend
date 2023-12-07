import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/const.dart';
import '../models/login_response_model.dart';

class AuthService {
  Future<LoginResponse?> loginUser(String username, String password) async {
    final url = Uri.parse(LOGIN_USER_API);

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print("User Token: ");

        print(responseData.toString());
        return LoginResponse.fromJson(responseData);
      } else {
        // Handle error, you might want to throw an exception or return null
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("Exception: $e");
      return null;
    }
  }
}
