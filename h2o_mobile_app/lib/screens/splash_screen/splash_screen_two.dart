import 'dart:async';

import 'package:flutter/material.dart';

import '../auth/login_screen.dart';

class SplashScreenTwo extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreenTwo({super.key});

  @override
  _SplashScreenTwoState createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the welcome screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // add svg image here,
              // SvgPicture.asset(
              //   // 'assets/images/life_dox_ai_logo.svg',
              //   'assets/logo/h2o_logo.svg',
              // ),
              Image.asset("assets/logo/logo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
