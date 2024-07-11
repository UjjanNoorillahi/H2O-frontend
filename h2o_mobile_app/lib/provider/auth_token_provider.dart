import 'package:flutter/material.dart';

class AuthTokenProvider extends ChangeNotifier {
  String _authToken = '';

  String get authToken => _authToken;

  void setAuthToken(String token) {
    _authToken = token;
    notifyListeners();
  }
}
