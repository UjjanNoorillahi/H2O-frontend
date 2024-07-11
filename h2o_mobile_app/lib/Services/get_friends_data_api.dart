import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/const.dart';
import '../models/get_user_data_model.dart';

class FriendSuggestionService {
  // get token from shared preferences
  Future<String?> getStoredUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve stored user data from shared preferences
    final String? userToken = prefs.getString('userToken');
    print("User Token: $userToken");
    return userToken;
  }

  Future<List<FriendSuggestion>?> getFriendSuggestions(String authToken) async {
    final url = Uri.parse(GET_FRIENDS_DATA);
    final userToken = await getStoredUserData();

    print("user Token: $userToken");
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": userToken!,
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
