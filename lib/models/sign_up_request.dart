class SignUpRequest {
  String fullName;
  String gender;
  String bloodType;
  String religion;
  String zodiacSign;
  String birthDate;
  String email;
  String password;

  SignUpRequest({
    required this.fullName,
    required this.gender,
    required this.bloodType,
    required this.religion,
    required this.zodiacSign,
    required this.birthDate,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "gender": gender,
      "blood_type": bloodType,
      "religion": religion,
      "zodiac_sign": zodiacSign,
      "birth_date": birthDate,
      "email": email,
      "password": password,
    };
  }
}
