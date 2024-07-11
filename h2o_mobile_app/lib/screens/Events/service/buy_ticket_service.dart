import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constant/const.dart';
import '../models/ticket_model.dart';

class BuyTicketService {
  final String userToken;

  BuyTicketService({ required this.userToken});

  Future<TicketResponse> purchaseTicket(String eventId) async {
    final url = Uri.parse('${BASE_URL}api/ticket/buy-ticket/$eventId');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': userToken.toString(),
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return TicketResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to purchase ticket: ${response.body}');
    }
  }
}
