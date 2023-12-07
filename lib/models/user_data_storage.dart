import 'package:h2o/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataStorage {
  static const String _keyUserId = 'user_id';
  static const String _keyFullName = 'full_name';
  static const String _keyGender = 'gender';
  static const String _keyBloodType = 'blood_type';
  static const String _keyReligion = 'religion';
  static const String _keyZodiacSign = 'zodiac_sign';
  static const String _keyBirthDate = 'birth_date';
  static const String _keyEmail = 'email';

  Future<void> saveUserData(UserData userData) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_keyUserId, userData.id);
    prefs.setString(_keyFullName, userData.fullName);
    prefs.setString(_keyGender, userData.gender);
    prefs.setString(_keyBloodType, userData.bloodType);
    prefs.setString(_keyReligion, userData.religion);
    prefs.setString(_keyZodiacSign, userData.zodiacSign);
    prefs.setString(_keyBirthDate, userData.birthDate.toIso8601String());
    prefs.setString(_keyEmail, userData.email);
  }

  Future<UserData?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(_keyUserId);
    String? fullName = prefs.getString(_keyFullName);
    String? gender = prefs.getString(_keyGender);
    String? bloodType = prefs.getString(_keyBloodType);
    String? religion = prefs.getString(_keyReligion);
    String? zodiacSign = prefs.getString(_keyZodiacSign);
    String? birthDateString = prefs.getString(_keyBirthDate);
    String? email = prefs.getString(_keyEmail);

    if (userId != null &&
        fullName != null &&
        gender != null &&
        bloodType != null &&
        religion != null &&
        zodiacSign != null &&
        birthDateString != null &&
        email != null) {
      DateTime birthDate = DateTime.parse(birthDateString);

      return UserData(
        id: userId,
        fullName: fullName,
        gender: gender,
        bloodType: bloodType,
        religion: religion,
        zodiacSign: zodiacSign,
        birthDate: birthDate,
        email: email,
      );
    } else {
      return null;
    }
  }
}
