import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/screens/auth/sign_up_screen.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/widgets/primary_button.dart';
import 'package:provider/provider.dart';

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
    isLogin = !isLogin;
    setState(() {});
  }

  void performLogin(String emailController, String passwordController) async {
    String username = emailController;
    String password = passwordController;

    toggleLogin();
    AuthService authService = AuthService();

    LoginResponse? loginResponse =
        await authService.loginUser(username, password);

    // if (loginResponse != null) {
    toggleLogin();
    print("Login successful!");

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
    // }
  }

  void getUserData(authToken) async {
    UserDataService userDataService = UserDataService();

    UserData? userData = await userDataService.getUserData(authToken);

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

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: const Padding(
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
              ),

              // const SizedBox(height: 100,),
              Image.asset("assets/logo/logo.png"),
              // const SizedBox(height: 60,),
              const SizedBox(
                height: 16,
              ),

              CustomTextField(

                labelText: 'Email',
                placeHolderColor: Colors.black.withOpacity(0.6000000059604645),
                controller: _emailController, textColor: Colors.black, boarderColor: appGreyColor,
              ),
              const SizedBox(
                height: 16,
              ),

              CustomTextField(


                textColor: Colors.black, boarderColor: appGreyColor,
                labelText: 'Password',
                placeHolderColor: Colors.black.withOpacity(0.6000000059604645),
                controller: _passwordController,
              ),
              // const SizedBox(height: 16,),

              const SizedBox(
                height: 18,
              ),
              PrimaryButton(
                text: "Sign In", color: Colors.black,
                onPressed: () => performLogin(
                    _emailController.text, _passwordController.text),
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => ChooseGender(),
                //   ),
                // );
                textColor: Colors.white,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 94,
                    height: 0.50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "OR Sign In with",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 94,
                    height: 0.50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/apple_icon.png"),
                  const SizedBox(width: 20),
                  Image.asset("assets/logo/google_icon.png"),
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              Container(
                child: const Text("Terms of use  Privacy Policy"),
              )
            ],
          ),
        ),
      ),
    );
  }
}