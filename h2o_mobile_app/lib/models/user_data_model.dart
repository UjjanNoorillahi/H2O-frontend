class UserData {
  final String id;
  final String fullName;
  final String gender;
  final String bloodType;
  final String religion;
  final String zodiacSign;
  final DateTime birthDate;
  final String email;

  UserData({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.bloodType,
    required this.religion,
    required this.zodiacSign,
    required this.birthDate,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] ?? '',
      fullName: json['full_name'] ?? '',
      gender: json['gender'] ?? '',
      bloodType: json['blood_type'] ?? '',
      religion: json['religion'] ?? '',
      zodiacSign: json['zodiac_sign'] ?? '',
      birthDate: DateTime.parse(json['birth_date'] ?? ''),
      email: json['email'] ?? '',
    );
  }
}
