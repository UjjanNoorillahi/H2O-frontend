import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/primary_button.dart';
import '../friends_suggestion_screen.dart';

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
    return CupertinoPageScaffold(
      // navigationbar
      navigationBar: const CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: Text(
            "Find Friends",
          ),
          leading: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          )),
      child: SingleChildScrollView(
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
                height: 10,
              ),

              timer
                  ? Container()
                  : // iOS Circular Progress Indicator
                  const CupertinoActivityIndicator(
                      radius: 20,
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
