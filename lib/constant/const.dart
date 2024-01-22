// constants.dart

import 'package:flutter/material.dart';

const String BASE_URL = 'http://3.144.244.10:3000/';

const String LOGIN_USER_API = BASE_URL + 'api/auth/login';
const String REGISTER_USER_API = BASE_URL + 'api/auth/register';
const String GET_USER_DATA = BASE_URL + 'api/user/getUserData';
const String GET_FRIENDS_DATA = '${BASE_URL}api/user/get-friend-suggestions';

const String SEND_MESSAGE = BASE_URL + 'api/user/send-message';

const String primaryFont = "Adamina-Regular";

const String seconaryFont = "Roboto-Regular";

const String APP_ICON = "assets/logo/logo.png";

// Primary Color
const Color appPrimaryColor = Colors.black;
// Secondary Color
const Color appGreyColor = Color(0xFFBBBDBE);
// white Color
const Color appWhiteColor = Colors.white;
