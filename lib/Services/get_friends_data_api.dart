import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/const.dart';
import '../models/get_user_data_model.dart';

class FriendSuggestionService {
  Future<List<FriendSuggestion>?> getFriendSuggestions(String authToken) async {
    final url = Uri.parse(GET_FRIENDS_DATA);

    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization":
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Njc3ODFmNTQ2OTFmMTE3YTkwZjBmMSIsInVzZXJuYW1lIjoiZmFpemlAZ21haWwuY29tIiwiaWF0IjoxNzAyODA3NDM1fQ.WKE3ZMei9ODVBFA-NvJ9lDI5bA9k275vX6PS7PMpz9w'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            jsonDecode(response.body)['matching_users'];
        print("Friend Suggestions: ");
        print(responseData.toString());
        return responseData
            .map((json) => FriendSuggestion.fromJson(json))
            .toList();
      } else {
        print("Error: ${response.statusCode}");
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
