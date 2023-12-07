import 'dart:async';

import 'package:flutter/material.dart';
import 'package:h2o/screens/friends_suggestion_screen.dart';
import 'package:h2o/screens/login_screen.dart';
import 'package:h2o/widgets/primary_button.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  static bool timer = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 8), () {
      timer = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Friends"),
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Image.asset("assets/logo/logo.png"),
              ),

              const SizedBox(
                height: 20,
              ),

              timer
                  ? Container()
                  : const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 4.0,
                    ),

              const SizedBox(
                height: 16,
              ),

              // SvgPicture.asset(
              //
              //   "assets/animation/waiting_animation.json",
              //   width: 100,
              //   height: 100,
              //   color: Colors.black,
              //
              // ),
              // const Text(
              //   "Wait...",
              //   style: TextStyle(color: Colors.black, fontSize: 28, fontFamily: 'Adamina-Regular',
              //       fontWeight: FontWeight.bold),
              // ),
              Text(
                timer
                    ? "Its done click to show"
                    : "We're searching friends for you",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w400),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: PrimaryButton(
                    text: timer ? "Continue" : "Wait",
                    color: Colors.black,
                    onPressed: () {
                      if (timer) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FriendsSuggestionPage()));
                      }
                    },
                    textColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
