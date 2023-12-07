import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant/const.dart';
import '../models/get_user_data_model.dart';

class FriendSuggestionService {

  Future<List<FriendSuggestion>?> getFriendSuggestions(String authToken) async {
    final url = Uri.parse(GET_FRIENDS_DATA);

    try {
      final response = await http.post(
        url,
        headers: {"Authorization": authToken},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body)['matching_users'];
        return responseData.map((json) => FriendSuggestion.fromJson(json)).toList();
      } else {
        // print("Token: $authToken");
        // print("Url: $GET_FRIENDS_DATA");
        // Handle error, you might want to throw an exception or return null
        print("Error.: ${response.statusCode}");
        print("Error.: ${response.body}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("Exception: $e");
      return null;
    }
  }
}
