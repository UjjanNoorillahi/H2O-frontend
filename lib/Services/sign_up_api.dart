import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant/const.dart';
import '../models/sign_up_request.dart';

class SignUpApi {
  static const String baseUrl =
      REGISTER_USER_API; // Replace with your API endpoint

  Future<bool> signUp(SignUpRequest signUpRequest) async {
    final url =
        Uri.parse(baseUrl); // Replace "signup" with your actual signup endpoint

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(signUpRequest.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful signup
        print('Successful signup');
        return true;
      } else {
        // Handle error, you might want to throw an exception or return false
        print("Error: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print("Exception: $e");
      return false;
    }
  }
}
