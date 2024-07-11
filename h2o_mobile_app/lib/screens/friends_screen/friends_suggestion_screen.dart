// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../Services/get_friends_data_api.dart';
// import '../../constant/const.dart';
// import '../../models/get_user_data_model.dart';
// import '../../widgets/friend_suggestion_card.dart';
// import '../home_screen/home_screen.dart';
//
// class FriendsSuggestionPage extends StatefulWidget {
//   const FriendsSuggestionPage({super.key});
//
//   @override
//   State<FriendsSuggestionPage> createState() => _FriendsSuggestionPageState();
// }
//
// class _FriendsSuggestionPageState extends State<FriendsSuggestionPage> {
//   String? authToken;
//   List<FriendSuggestion>? friendSuggestions = [];
//   String friendsData = "no value";
//
//   bool isFriendsList = false;
//
//   @override
//   void initState() {
//     getFriendSuggestions();
//     super.initState();
//   }
//
//   void toggleCircular() {
//     isFriendsList = !isFriendsList;
//     setState(() {});
//   }
//
//   printFriendsData() {
//     if (friendSuggestions != null) {
//       print("Friend Suggestions Received:");
//       for (FriendSuggestion suggestion in friendSuggestions!) {
//         Text("Full Name: ${suggestion.fullName}");
//         Text("Gender: ${suggestion.gender}");
//         Text("Email: ${suggestion.email}");
//         Text("Religion: ${suggestion.religion}");
//         Text("Zodiac Sign: ${suggestion.zodiacSign}");
//         Text(
//             "Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
//         Text("Compatibility: ${suggestion.compatibility}");
//         Text("--------------");
//       }
//       // Add your logic to use the friend suggestions
//     }
//   }
//
//   void getFriendSuggestions() async {
//     String _authToken =
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Njc3ODFmNTQ2OTFmMTE3YTkwZjBmMSIsInVzZXJuYW1lIjoiZmFpemlAZ21haWwuY29tIiwiaWF0IjoxNzAyODA3NDM1fQ.WKE3ZMei9ODVBFA-NvJ9lDI5bA9k275vX6PS7PMpz9w"; // Replace with your actual auth token
//
//     FriendSuggestionService friendSuggestionService = FriendSuggestionService();
//
//     friendSuggestions =
//         await friendSuggestionService.getFriendSuggestions(_authToken!);
//
//     if (friendSuggestions != null) {
//       toggleCircular();
//       print("Friend Suggestions Received:");
//       for (FriendSuggestion suggestion in friendSuggestions!) {
//         print("Full Name: ${suggestion.fullName}");
//         print("Gender: ${suggestion.gender}");
//         print("Email: ${suggestion.email}");
//         print("Religion: ${suggestion.religion}");
//         print("Zodiac Sign: ${suggestion.zodiacSign}");
//         print(
//             "Birth Date: ${suggestion.birthDate.toLocal()}"); // Convert to local time
//         print("Compatibility: ${suggestion.compatibility}");
//         print("--------------");
//       }
//       // Add your logic to use the friend suggestions
//
//       setState(() {
//         // Update the state with the received friend suggestions
//         friendSuggestions = friendSuggestions;
//       });
//     } else {
//       print("Failed to get friend suggestions.");
//       // Add error handling or display an error message
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final authTokenProvider = Provider.of<AuthTokenProvider>(context);
//     return CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: const Text('Find Friends'),
//           leading: CupertinoNavigationBarBackButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => const Home(),
//                 ),
//               );
//             },
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.22,
//                 // width: 100,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.12,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Center(
//                         child: Container(
//                           padding: const EdgeInsets.all(10.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15.0),
//                             border: Border.all(color: appGreyColor, width: 1.0),
//                           ),
//                           child: CupertinoSearchTextField(
//                             padding: const EdgeInsets.all(10.0),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.rectangle,
//                             ),
//                             onChanged: (value) {
//                               print(value);
//                             },
//                           ),
//                         ),
//                       ),
//                       // SearchBar(
//                       //   backgroundColor:
//                       //       const MaterialStatePropertyAll<Color>((Colors.white)),
//                       //   elevation: const MaterialStatePropertyAll<double>((0.0)),
//                       //   // shape: MaterialStatePropertyAll<OutlinedBorder>((
//                       //   //
//                       //   // )),
//                       //
//                       //   // controller: controller,
//                       //   padding: const MaterialStatePropertyAll<EdgeInsets>(
//                       //       EdgeInsets.symmetric(horizontal: 16.0)),
//                       //   hintText: 'Search',
//                       //   onTap: () {
//                       //     // controller.openView();
//                       //   },
//                       //   onChanged: (_) {
//                       //     // controller.openView();
//                       //   },
//                       //   leading: const Icon(Icons.search),
//                       //   // trailing: <Widget>[
//                       //   //   Tooltip(
//                       //   //     message: 'Change brightness mode',
//                       //   //     child: IconButton(
//                       //   //       isSelected: isDark,
//                       //   //       onPressed: () {
//                       //   //         setState(() {
//                       //   //           isDark = !isDark;
//                       //   //         });
//                       //   //       },
//                       //   //       icon: const Icon(Icons.wb_sunny_outlined),
//                       //   //       selectedIcon: const Icon(Icons.brightness_2_outlined),
//                       //   //     ),
//                       //   //   )
//                       //   // ],
//                       // ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: isFriendsList == false
//                     ? const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: CupertinoActivityIndicator(
//                               radius: 20,
//                             ),
//                           ),
//                         ],
//                       ) // Display a loading indicator while fetching data
//                     : ListView.builder(
//                         itemCount: friendSuggestions!.length,
//                         itemBuilder: (context, index) {
//                           FriendSuggestion suggestion =
//                               friendSuggestions![index];
//                           return FriendSuggestionCard(
//                             suggestion: suggestion,
//                             isShowFriendRequestButton: false,
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
