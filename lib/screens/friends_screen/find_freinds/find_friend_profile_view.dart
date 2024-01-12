import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/screens/friends_screen/friends_suggestion_screen.dart';
import 'package:h2o/widgets/primary_button.dart';

class FindFriendProfileScreen extends StatefulWidget {
  final suggestion;
  const FindFriendProfileScreen({super.key, required this.suggestion});

  @override
  State<FindFriendProfileScreen> createState() =>
      _FindFriendProfileScreenState();
}

class _FindFriendProfileScreenState extends State<FindFriendProfileScreen> {
  bool isFriendSent = false;
  void toggleFriendRequest() {
    isFriendSent = !isFriendSent;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    // String suggestion = widget.suggestion;
    return CupertinoPageScaffold(
        // add navigation back button
        navigationBar: CupertinoNavigationBar(
          // middle: Text(widget.suggestion.fullName),
          middle: Text("User Details"),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FriendsSuggestionPage(),
                ),
              );
            },
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            // add media query
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 100,
                  ),
                  // add image
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage("assets/logo/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                  const SizedBox(
                    height: 15,
                  ),
                  // add name
                   Text(
                    widget.suggestion.fullName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.suggestion.email,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // add button
                  isFriendSent ? PrimaryButton(
                    onPressed: () {
                      // toggleFriendRequest();
                    },
                    color: Colors.white, text: 'Friend Request Sent', textColor: Colors.black,
                  ) :
                  PrimaryButton(
                    onPressed: () {
                      toggleFriendRequest();
                    },
                    color: Colors.black, text: 'Add Friend', textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
