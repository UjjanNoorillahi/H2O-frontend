class SignUpRequest {
  String fullName;
  // String gender;
  // String bloodType;
  // String religion;
  // String zodiacSign;
  // String birthDate;
  String email;
  String password;
  String phoneNumber;
  String role;

  SignUpRequest({
    required this.fullName,
    // required this.gender,
    // required this.bloodType,
    // required this.religion,
    // required this.zodiacSign,
    // required this.birthDate,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,

  });

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "phone_number": phoneNumber,
      // "gender": gender,
      // "blood_type": bloodType,
      // "religion": religion,
      // "zodiac_sign": zodiacSign,
      // "birth_date": birthDate,
      "role": role,
      "email": email,
      "password": password,


    };
  }
}
