import 'package:flutter/material.dart';

import '../models/get_user_data_model.dart';
import '../screens/chat_screen.dart';

class FriendSuggestionCard extends StatelessWidget {
  final FriendSuggestion suggestion;
  final bool isShowFriendRequestButton;

  const FriendSuggestionCard(
      {Key? key,
      required this.suggestion,
      required this.isShowFriendRequestButton})
      : super(key: key);

  final isSendRequest = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              suggestion: suggestion,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.white,
        child: ListTile(
          leading: Stack(
            children: [
              Image.asset('assets/logo/logo.png'),
            ],
          ),
          trailing: TextButton(
            onPressed: () {},

            // style: const ButtonStyle(),
            //   backgroundColor: MaterialStatePropertyAll<Color>((
            //   Colors.black
            //   )),
            // ),
            child: isShowFriendRequestButton
                ? Text("")
                : Text(
                    "Add Friend",
                    style: TextStyle(color: Colors.black),
                  ),
          ),

          // CircleAvatar(
          //   radius: 28,
          //   // Add your avatar properties here, e.g., backgroundImage, radius, etc.
          //   child: Icon(Icons.person, size: 38,), // You can replace this with your avatar image
          // ),
          title: Text(
            suggestion.fullName,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suggestion.email,
                style: const TextStyle(fontSize: 16),
              ),
              // Text(
              //   "Compatibility: ${suggestion.compatibility}",
              //   style: const TextStyle(fontSize: 16),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
