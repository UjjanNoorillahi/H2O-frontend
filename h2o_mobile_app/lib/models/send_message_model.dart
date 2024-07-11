class MessageRequest {
  final String receiverId;
  final String content;

  MessageRequest({
    required this.receiverId,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      'content': content,
    };
  }
}

class ApiResponse {
  final bool success;
  final String message;

  ApiResponse({
    required this.success,
    required this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
