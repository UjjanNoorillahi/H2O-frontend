class FriendSuggestion {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String role;


  FriendSuggestion({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory FriendSuggestion.fromJson(Map<String, dynamic> json) {
    return FriendSuggestion(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
