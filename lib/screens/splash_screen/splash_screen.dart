import 'dart:async';

import 'package:flutter/material.dart';
import 'package:h2o/screens/splash_screen/splash_screen_two.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the welcome screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreenTwo(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
