import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:life_dox_ai/presentation/screens/get_started_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

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
    Timer(const Duration(seconds: 5), () {
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