import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/booked_event_model.dart';

class BookedEventService {
  final String baseUrl;

  BookedEventService({required this.baseUrl});

  Future<List<Event>> getBookedEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    final url = Uri.parse('${baseUrl}api/event/booked-events');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': userToken.toString(),
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load booked events: ${response.body}');
    }
  }
}
