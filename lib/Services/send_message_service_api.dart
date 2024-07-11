import 'package:dio/dio.dart';

import '../constant/const.dart';
import '../models/send_message_model.dart';

class SendMessageServiceApi {
  final Dio _dio = Dio();

  Future<ApiResponse> sendMessage(String token, MessageRequest request) async {
    try {
      final response = await _dio.post(
        SEND_MESSAGE,
        data: request.toJson(),
        options: Options(
          headers: {'Authorization': token},
        ),
      );

      return ApiResponse.fromJson(response.data);
    } catch (error) {
      print('Error: $error');
      // Handle error as needed
      rethrow;
    }
  }
}
