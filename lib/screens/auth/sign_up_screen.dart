import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:h2o/widgets/custom_textfield.dart';
import 'package:h2o/widgets/primary_button.dart';

import '../../Services/sign_up_api.dart';
import '../../models/sign_up_request.dart';
import '../friends_screen/find_freinds/find_friends_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? selectedDate;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _zodiacSignController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //     // widget.onDateSelected(picked);
  //   }
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 180.0,
          width: double.infinity,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(1900),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              // Update the selectedDate or the controller's text as needed
              setState(() {
                selectedDate = newDate;
              });
            },
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      // Update your state or controller here
      setState(() {
        selectedDate = pickedDate;
      });
      // widget.onDateSelected(pickedDate);
    }
  }

  void registerUser() async {
    // Get data from controllers
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String bloodType = _bloodGroupController.text;
    String religion = _religionController.text;
    String zodiacSign = _zodiacSignController.text;
    String birthDate = "12/12/2012";
    String email = _emailController.text;
    String password = _passwordController.text;

    // Create SignUpRequest instance
    SignUpRequest signUpRequest = SignUpRequest(
      fullName: firstName,
      gender: "male",
      bloodType: bloodType,
      religion: religion,
      zodiacSign: zodiacSign,
      birthDate: birthDate,
      email: email,
      password: password,
    );

    // Call the API
    bool success = await SignUpApi().signUp(signUpRequest);

    // Handle the result, you can show a message or navigate to another screen
    if (success) {
      print("Signup successful!");
      // Add your navigation logic here
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FindFriendsScreen(),
        ),
      );
    } else {
      print("Signup failed.");
      print(signUpRequest.toJson());
      // Add error handling or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              const Text(
                "Profile details",

                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/logo/logo.png", scale: 1.5,),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign up to continue",
                style: TextStyle(
                    fontFamily: 'Adamina',
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 18),

              Column(
                children: [
                  CustomTextField(
                    labelText: 'First Name',
                    controller: _firstNameController, textColor: Colors.white, boarderColor: Colors.white,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),

                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                    labelText: 'Last Name',
                    controller: _lastNameController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                    labelText: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                    labelText: 'Password',
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    labelText: 'Blood Group',
                    controller: _bloodGroupController,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    labelText: 'Zodiac Signs',
                    controller: _zodiacSignController,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white, boarderColor: Colors.white,
                    labelText: 'Religion',
                    controller: _religionController,
                    placeHolderColor: Colors.white.withOpacity(0.6000000059604645),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 28, right: 28),
                  //   child: TextFormField(
                  //     readOnly: true,
                  //     onTap: () => _selectDate(context),
                  //     decoration: InputDecoration(
                  //       // labelText: widget.labelText,
                  //       contentPadding: const EdgeInsets.all(20),
                  //       // hintText: widget.hintText,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //
                  //       prefixIcon: IconButton(
                  //         icon: Icon(Icons.calendar_month_rounded),
                  //         onPressed: () => _selectDate(context),
                  //       ),
                  //     ),
                  //     controller: TextEditingController(
                  //       text: selectedDate == null
                  //           ? ''
                  //           : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: CupertinoTextField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefix: IconButton(
                        icon: Icon(Icons.calendar_today,
                            color: Colors.white.withOpacity(0.7), size: 20),
                        onPressed: () => _selectDate(context),
                      ),
                      controller: TextEditingController(
                        text: selectedDate == null
                            ? ''
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              PrimaryButton(
                text: "Sign Up",

                color: Colors.white,
                onPressed: registerUser
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => ChooseGender(),
                //   ),
                // );
                ,
                textColor: Colors.black,
              ),
              // const SizedBox(height: 28,),

              const SizedBox(
                height: 24,
              ),

              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Already have an account? Sign In",
                    style: TextStyle(color: Colors.white),
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
                      color: Colors.white.withOpacity(0.4000000059604645),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "OR Sign Up with",
                    style: TextStyle(color: Colors.white)
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 94,
                    height: 0.50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4000000059604645),
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
                height: 30,
              ),
              Container(
                child: const Text("Terms of use  Privacy Policy"),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
