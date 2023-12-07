class FriendSuggestion {
  final String fullName;
  final String gender;
  final String email;
  final String religion;
  final String zodiacSign;
  final DateTime birthDate;
  final int compatibility;

  FriendSuggestion({
    required this.fullName,
    required this.gender,
    required this.email,
    required this.religion,
    required this.zodiacSign,
    required this.birthDate,
    required this.compatibility,
  });

  factory FriendSuggestion.fromJson(Map<String, dynamic> json) {
    return FriendSuggestion(
      fullName: json['full_name'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      religion: json['religion'] ?? '',
      zodiacSign: json['zodiac_sign'] ?? '',
      birthDate: DateTime.parse(json['birth_date'] ?? ''),
      compatibility: json['compatibility'] ?? 0,
    );
  }
}
