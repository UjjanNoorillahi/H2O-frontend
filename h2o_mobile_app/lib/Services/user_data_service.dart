import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/const.dart';
import '../models/user_data_model.dart';

class UserDataService {
  Future<UserData?> getUserData(String userID, String authToken) async {
    final url = Uri.parse(GET_SINGLE_USER_DATA+"6637ee090998f64af056b449");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('data') ?? '';
    // print("User data1: $userData");

    // log("URL: $url");

    try {
      final response = await http.get(
        url,
        headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzdlZTA5MDk5OGY2NGFmMDU2YjQ0OSIsInVzZXJuYW1lIjoiYWxleGFuZGVyYWJpdHRhbjBAZ21haWwuY29tIiwiaWF0IjoxNzE4NDM1MjAxLCJleHAiOjE3MTkwNDAwMDF9.BZiWdcRsOj99Jdl7LipyaclQbRcxBwiBuH1bTISHf-M"},
      );

      log("Response: ${response.body}");


      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        log("Response inside response condition: ${response.body}");

        return UserData.fromJson(responseData);
      } else {
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
