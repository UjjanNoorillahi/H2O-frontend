import 'dart:convert';
import 'package:h2o/constant/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/get_event_model_class.dart';

class EventService {
  final String baseUrl = GET_EVENT;



  Future<List<Event>> fetchEvents() async {

    // get user data
     SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    // print("user Token: $userToken");


    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': userToken.toString(), // Add authorization token to headers
    });

    if (response.statusCode == 200) {
      List<dynamic> eventJson = jsonDecode(response.body);
      // print(response.statusCode);
      // print(response.body);
      return eventJson.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events${response.body}');
    }
  }
}
