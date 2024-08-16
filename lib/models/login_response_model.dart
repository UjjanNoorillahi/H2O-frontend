class LoginResponse {
  final String message;
  final String token;
  final String? role;

  LoginResponse({required this.message, required this.token, this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? '',
      token: json['data'] ?? '',
      role: json['user']['role'] ?? '',
    );
  }
}
