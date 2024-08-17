import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/widgets/custom_textfield.dart';
import 'package:toastification/toastification.dart';

import '../../Services/sign_up_api.dart';
import '../../models/sign_up_request.dart';
import '../../widgets/custom_password_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? selectedDate;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bloodtypeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  bool isSignUp = false;

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
    isSignUp = true;
    setState(() {});
    String firstName = _firstNameController.text;
    String phoneNumber = _phoneNumberController.text;

    String email = _emailController.text;
    String password = _passwordController.text;
    String role = selectedValue;

    // if (password != confirmPassword) {
    //   toastification.show(
    //     context: context,
    //     title: Text('Password is not equal'),
    //     autoCloseDuration: const Duration(seconds: 2),
    //   );
    //   isSignUp = false;
    //   return;
    // }

    try {
      // Create SignUpRequest instance
      SignUpRequest signUpRequest = SignUpRequest(
        fullName: firstName,
        // gender: "male",
        // bloodType: bloodType,
        // religion: religion,
        // zodiacSign: zodiacSign,
        // birthDate: birthDate,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
      );

      // Call the API
      bool success = await SignUpApi().signUp(signUpRequest);

      // Handle the result, you can show a message or navigate to another screen

      // if (bloodGroup == "" ||
      //     firstName == "" ||
      //     lastName == "" ||
      //     bloodType == "" ||
      //     religion == "" ||
      //     zodiacSign == "" ||
      //     birthDate == "" ||
      //     email == "" ||
      //     password == "") {
      //   isSignUp = false;
      //   setState(() {});
      // }

      if (success == true) {
        toastification.show(
          context: context,
          title: Text('Signup successful!'),
          autoCloseDuration: const Duration(seconds: 2),
        );
        print(success);
        isSignUp = false;
        setState(() {});
        print("Signup successful!");

        // Add your navigation logic here
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Home(isAdmin: role == 'admin',),
          ),
        );
      } else {
        print("Signup failed.");
        isSignUp = false;
        setState(() {});
        print(signUpRequest.toJson());
        // Add error handling or display an error message
      }
    } catch (e) {
      isSignUp = false;
      setState(() {});
      print(e);
    }
  }

  String selectedValue = "Role"; // Default text

  void _showCupertinoPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 32,
                children: const [
                  Center(child: Text("User")),
                  Center(child: Text("Admin")),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    selectedValue = value == 0 ? "User" : "Admin";
                  });
                },
              ),
            ),
            CupertinoButton(
              child: const Text("Select"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              const Text(
                "Profile details",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/logo/logo.png",
                scale: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign up to continue",
                style: TextStyle(
                    fontFamily: 'Adamina',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 18),

              Column(
                children: [
                  CustomTextField(
                    labelText: 'Full Name',
                    controller: _firstNameController,
                    textColor: Colors.white,
                    boarderColor: Colors.white,
                    obscureText: false,
                    placeHolderColor:
                        Colors.white.withOpacity(0.6000000059604645),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white,
                    boarderColor: Colors.white,
                    obscureText: false,
                    placeHolderColor:
                        Colors.white.withOpacity(0.6000000059604645),
                    labelText: 'Phone Number',
                    controller: _phoneNumberController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    textColor: Colors.white,
                    boarderColor: Colors.white,
                    obscureText: false,
                    placeHolderColor:
                        Colors.white.withOpacity(0.6000000059604645),
                    labelText: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // CustomTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   obscureText: true,
                  //   placeHolderColor:
                  //       Colors.white.withOpacity(0.6000000059604645),
                  //   labelText: 'Password',
                  //   controller: _passwordController,
                  // ),

                  CustomPasswordTextField(
                    textColor: Colors.white,
                    boarderColor: Colors.white,
                    obscureText: true,
                    placeHolderColor: Colors.white.withOpacity(0.6),
                    labelText: 'Password',
                    controller: _passwordController,
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  // CustomPasswordTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   obscureText: true,
                  //   placeHolderColor: Colors.white.withOpacity(0.6),
                  //   labelText: 'Confirm Password',
                  //   controller: _confirmPasswordController,
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   labelText: 'Blood Group',
                  //   obscureText: false,
                  //   controller: _bloodGroupController,
                  //   placeHolderColor:
                  //       Colors.white.withOpacity(0.6000000059604645),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  //
                  // CustomTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   labelText: 'RH Type (+/-)',
                  //   controller: _bloodtypeController,
                  //   obscureText: false,
                  //   placeHolderColor:
                  //       Colors.white.withOpacity(0.6000000059604645),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   labelText: 'Zodiac Signs',
                  //   obscureText: false,
                  //   controller: _zodiacSignController,
                  //   placeHolderColor:
                  //       Colors.white.withOpacity(0.6000000059604645),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //   textColor: Colors.white,
                  //   boarderColor: Colors.white,
                  //   labelText: 'Religion',
                  //   obscureText: false,
                  //   controller: _religionController,
                  //   placeHolderColor:
                  //       Colors.white.withOpacity(0.6000000059604645),
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
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
                      placeholder: 'Birthdate',
                      placeholderStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      style: TextStyle(color: Colors.white),
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
                            : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}",
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: _showCupertinoPicker,
                      child: Container(
                        height: 48, // Set the height
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                selectedValue,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.arrow_drop_down_rounded,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              // PrimaryButton(
              //   text: "Sign Up",
              //   color: Colors.white,
              //   onPressed: registerUser
              //   // Navigator.of(context).pushReplacement(
              //   //   MaterialPageRoute(
              //   //     builder: (context) => ChooseGender(),
              //   //   ),
              //   // );
              //   ,
              //   textColor: Colors.black,
              // ),

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
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: isSignUp
                      ? CupertinoActivityIndicator(
                          radius: 15,
                          color: Colors.black,
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Adamina-Regular',
                              fontWeight: FontWeight.w400),
                        ),
                ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: 94,
              //       height: 0.50,
              //       decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.4000000059604645),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     const Text("OR Sign Up with",
              //         style: TextStyle(color: Colors.white)),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Container(
              //       width: 94,
              //       height: 0.50,
              //       decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.4000000059604645),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // // Row(
              // //   mainAxisAlignment: MainAxisAlignment.center,
              // //   children: [
              // //     Image.asset("assets/logo/apple_icon.png"),
              // //     const SizedBox(width: 20),
              // //     Image.asset("assets/logo/google_icon.png"),
              // //   ],
              // // ),
              //
              // const SizedBox(
              //   height: 30,
              // ),
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
