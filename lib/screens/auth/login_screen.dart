import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:h2o/screens/auth/sign_up_screen.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../Services/login_api.dart';
import '../../Services/user_data_service.dart';
import '../../constant/const.dart';
import '../../models/login_response_model.dart';
import '../../models/user_data_model.dart';
import '../../models/user_data_storage.dart';
import '../../provider/auth_token_provider.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLogin = false;

  void toggleLogin() {
    // isLogin = !isLogin;
    setState(() {});
  }

  void performLogin(String emailController, String passwordController) async {
    // show toast if email and password is empty
    if (emailController.isEmpty) {
      toastification.show(
        context: context,
        title: const Text('Login Failed!'),
        description: const Text('Please enter your email.'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      return;
    } else if (passwordController.isEmpty) {
      toastification.show(
        context: context,
        title: const Text('Login Failed!'),
        description: const Text('Please enter your password.'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      return;
    }
    isLogin = true;
    toggleLogin();
    String username = emailController;
    String password = passwordController;
    if (username.isEmpty || password.isEmpty) {
      // add 3 seconds timer

      Timer(const Duration(seconds: 2), () {
        // toggleLogin();
        isLogin = false;
        toggleLogin();
      });

      // show toast to enter email and password

      return;
    } else {
      isLogin = true;
      toggleLogin();
      AuthService authService = AuthService();

      try {
        LoginResponse? loginResponse =
            await authService.loginUser(username, password);

        if (loginResponse != null) {
          print(loginResponse.toString());
          toggleLogin();
          print("Login successful!");
          isLogin = false;
          toggleLogin();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
              // builder: (context) => FindFriendsScreen(),
            ),
          );

          // getUserData(loginResponse.token);
          // } else {
          //   print("Login failed.");
          //   // Add error handling or display an error message
        } else if (loginResponse?.message != 'Login successful') {
          toastification.show(
            context: context,
            title: const Text('Login Failed!'),
            description: const Text('Please enter valid email and password.'),
            autoCloseDuration: const Duration(seconds: 3),
          );
          print("Login failed.");
          isLogin = false;
          toggleLogin();
          // Add error handling or display an error message
        }
      } catch (e) {
        isLogin = false;
        toggleLogin();
        print(e);
      }
    }
  }

  void getUserData(authToken) async {
    UserDataService userDataService = UserDataService();

    UserData? userData = await userDataService.getUserData("", authToken);

    if (userData != null) {
      // store user data into sharedPreference
      UserDataStorage().saveUserData(userData);

      // Retrieve user data
      UserData? storedUserData = await UserDataStorage().getUserData();
      if (storedUserData != null) {
        // Use the retrieved user data
        print("Stored User Data:");
        print("ID: ${storedUserData.id}");
        print("Full Name: ${storedUserData.fullName}");
        // ... (print other fields)
      } else {
        log("No user data stored.");
      }
    } else {
      print("Failed to get user data.");
      // Add error handling or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final authTokenProvider = Provider.of<AuthTokenProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 24, right: 180, top: 55),
                  child: Column(
                    children: [
                      Text(
                        'Login to H2O',
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: primaryFont,
                          fontWeight: FontWeight.w600,
                          // letterSpacing: -0.56,
                        ),
                      ),
                      Text(
                        'Enter your email and password.',
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: primaryFont,
                          // fontWeight: FontWeight.w500,
                          // letterSpacing: -0.56,
                        ),
                      ),
                    ],
                  )),

              // const SizedBox(height: 100,),
              Image.asset("assets/logo/logo.png"),
              // const SizedBox(height: 60,),
              const SizedBox(
                height: 16,
              ),

              CustomTextField(
                labelText: 'Email',
                placeHolderColor: Colors.black.withOpacity(0.6000000059604645),
                controller: _emailController,
                obscureText: false,
                textColor: Colors.black,
                boarderColor: appGreyColor,
              ),
              const SizedBox(
                height: 16,
              ),

              CustomTextField(
                textColor: Colors.black,
                boarderColor: appGreyColor,
                obscureText: true,
                labelText: 'Password',
                placeHolderColor: Colors.black.withOpacity(0.6),
                controller: _passwordController,
                showPassword: true, // Enable show password functionality
              ),

              // const SizedBox(height: 16,),

              const SizedBox(
                height: 18,
              ),

              // custom Sign in button
              Container(
                width: 295,
                height: 56,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => performLogin(
                      _emailController.text, _passwordController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: isLogin
                      ? const CupertinoActivityIndicator(
                          radius: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Adamina-Regular',
                              fontWeight: FontWeight.w400),
                        ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
