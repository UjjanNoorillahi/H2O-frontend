import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/login_screen.dart';

import '../Services/get_friends_data_api.dart';
import '../models/get_user_data_model.dart';
import '../widgets/friend_suggestion_card.dart';

class ConnectedFriendsScreen extends StatefulWidget {
  const ConnectedFriendsScreen({super.key});

  @override
  State<ConnectedFriendsScreen> createState() => _ConnectedFriendsScreenState();
}

class _ConnectedFriendsScreenState extends State<ConnectedFriendsScreen> {
  String? authToken;
  List<FriendSuggestion>? friendSuggestions = [];
  String friendsData = "no value";

  bool isFriendsList = false;

  @override
  void initState() {
    getFriendSuggestions();
    super.initState();
  }

  void toggleCircular() {
    isFriendsList = !isFriendsList;
    setState(() {});
  }

  printFriendsData() {
    if (friendSuggestions != null) {
      print("Friend Suggestions Received:");
      for (FriendSuggestion suggestion in friendSuggestions!) {
        Text("Full Name: ${suggestion.fullName}");
        Text("Gender: ${suggestion.gender}");
        Text("Email: ${suggestion.email}");
        Text("Religion: ${suggestion.religion}");
        Text("Zodiac Sign: ${suggestion.zodiacSign}");
        Text(
            "Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
        Text("Compatibility: ${suggestion.compatibility}");
        const Text("--------------");
      }
      // Add your logic to use the friend suggestions
    }
  }

  void getFriendSuggestions() async {
    String _authToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTI3ZTlhZWRjYmVkODc1OTA0MDdmZiIsInVzZXJuYW1lIjoic2FqaWRAZ21haWwuY29tIiwiaWF0IjoxNzAwMzc3NTUyfQ.ZenSxB1HqjPjSABnbveQNltLsdVJkbEXFUe2SnR4nU4"; // Replace with your actual auth token

    FriendSuggestionService friendSuggestionService = FriendSuggestionService();

    friendSuggestions =
        await friendSuggestionService.getFriendSuggestions(_authToken!);

    if (friendSuggestions != null) {
      toggleCircular();
      print("Friend Suggestions Received:");
      for (FriendSuggestion suggestion in friendSuggestions!) {
        print("Full Name: ${suggestion.fullName}");
        print("Gender: ${suggestion.gender}");
        print("Email: ${suggestion.email}");
        print("Religion: ${suggestion.religion}");
        print("Zodiac Sign: ${suggestion.zodiacSign}");
        print(
            "Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
        print("Compatibility: ${suggestion.compatibility}");
        print("--------------");
      }
      // Add your logic to use the friend suggestions

      setState(() {
        // Update the state with the received friend suggestions
        friendSuggestions = friendSuggestions;
      });
    } else {
      print("Failed to get friend suggestions.");
      // Add error handling or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authTokenProvider = Provider.of<AuthTokenProvider>(context);
    return Scaffold(
        appBar: AppBar(
          // title: const Text("Friends Suggestion"),
          // leading: InkWell(
          //   child: const Icon(Icons.arrow_back_ios),
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         builder: (context) => const FindFriendsScreen(),
          //       ),
          //     );
          //   },
          // ),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: '1',
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text('Logout')),
                ),
                const PopupMenuItem(
                  value: '2',
                  child: Text('About us'),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                // width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "   H2O",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: primaryFont,
                      ),
                    ),
                    const Text(
                      "     Connecting People all over the World ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: primaryFont,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SearchBar(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>((Colors.white)),
                      elevation: MaterialStatePropertyAll<double>((0.0)),
                      // shape: MaterialStatePropertyAll<OutlinedBorder>((
                      //
                      // )),

                      // controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      hintText: 'Search',
                      onTap: () {
                        // controller.openView();
                      },
                      onChanged: (_) {
                        // controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      // trailing: <Widget>[
                      //   Tooltip(
                      //     message: 'Change brightness mode',
                      //     child: IconButton(
                      //       isSelected: isDark,
                      //       onPressed: () {
                      //         setState(() {
                      //           isDark = !isDark;
                      //         });
                      //       },
                      //       icon: const Icon(Icons.wb_sunny_outlined),
                      //       selectedIcon: const Icon(Icons.brightness_2_outlined),
                      //     ),
                      //   )
                      // ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isFriendsList == false
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 4.0,
                        ),
                      ) // Display a loading indicator while fetching data
                    : ListView.builder(
                        itemCount: friendSuggestions!.length,
                        itemBuilder: (context, index) {
                          FriendSuggestion suggestion =
                              friendSuggestions![index];
                          return FriendSuggestionCard(
                            suggestion: suggestion,
                            isShowFriendRequestButton: true,
                          );
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
