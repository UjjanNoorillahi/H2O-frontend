// event_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:h2o/constant/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/register_event_model.dart';

class RegisterEventService {
  Future<EventModel?> createEvent({
    required String title,
    required String description,
    required File image,
    required DateTime date,
    required String time,
    required String venue,
    required int totalSeats,
    required int ticketPrice,
  }) async {
    final uri = Uri.parse(CREATE_EVENT);

    // Retrieve the user token from SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    var request = http.MultipartRequest('POST', uri)
      ..headers['Content-Type'] = 'application/json'
      ..headers['Authorization'] = userToken.toString()
      ..fields['title'] = title
      ..fields['description'] = description
      ..fields['date'] = date.toIso8601String()
      ..fields['time'] = "12:00 PM"
      ..fields['venue'] = venue
      ..fields['totalSeats'] = totalSeats.toString()
      ..fields['ticketPrice'] = ticketPrice.toString();

    // Add the image file with the key 'mediaFiles'
    request.files.add(await http.MultipartFile.fromPath('mediaFiles', image.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(responseBody);
        return EventModel.fromJson(decodedJson['event']);
      } else {
        print('Failed to create event. Status code: ${response.statusCode}');
        print('Response Body: $responseBody');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
