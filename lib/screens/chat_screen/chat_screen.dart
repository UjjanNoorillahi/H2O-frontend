// import 'package:flutter/material.dart';
// import 'package:h2o/screens/friends_suggestion_screen.dart';
//
// import '../models/get_user_data_model.dart';
//
// class ChatScreen extends StatefulWidget {
//   final FriendSuggestion suggestion;
//
//   const ChatScreen({super.key, required this.suggestion});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 70,
//         title: Row(
//           children: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                         builder: (context) => const FriendsSuggestionPage()),
//                   );
//                 },
//                 icon: Icon(Icons.arrow_back)),
//             CircleAvatar(),
//             SizedBox(
//               width: 20,
//             ),
//             Text(widget.suggestion.fullName),
//           ],
//         ),
//         actions: [
//           PopupMenuButton(
//             icon: Icon(
//               Icons.more_vert_outlined,
//               color: Colors.black,
//             ),
//             itemBuilder: (context) => const [
//               PopupMenuItem(
//                 value: '1',
//                 child: Text('option 1'),
//               ),
//               PopupMenuItem(
//                 value: '2',
//                 child: Text('option 2'),
//               ),
//               PopupMenuItem(
//                 value: '2',
//                 child: Text('option 3'),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//         child: Column(
//           children: [
//             Container(
//               // messages portion
//               color: Colors.green,
//               height: MediaQuery.of(context).size.height *
//                   0.75, // 70% of screen height
//               width:
//                   MediaQuery.of(context).size.width, // Full width of the screen
//               child: Text("Hello"),
//             ),
//             Expanded(
//                 // Search bar portion of the whole screen
//                 child: Container(
//               width: MediaQuery.of(context).size.width,
//               color: Colors.red,
//               child: Text("remaning part"),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/send_message_service_api.dart';
import '../../Services/websocket_service.dart';
import '../../models/get_user_data_model.dart';
import '../../models/send_message_model.dart';
import '../friends_screen/friends_suggestion_screen.dart';

class ChatScreen extends StatefulWidget {
  final FriendSuggestion suggestion;

  const ChatScreen({super.key, required this.suggestion});

  static const String screen_id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late SocketIOService socketIOService;

  List<Map<String, dynamic>> _messages = [
    // write dummy messages
    {
      'message': 'Hello',
      'from': 'sender',
    },
    {
      'message': 'Hi',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine',
      'from': 'reciever',
    },
    {
      'message': 'How are you?',
      'from': 'sender',
    },
    {
      'message': 'I am fine, thats perfect lets talk about something else',
      'from': 'reciever',
    },
  ];
  bool _lastMsgIsRecieved = true;
  int count = 0;
  double _topMarginofTile = 0;

  TextEditingController userMessageController = TextEditingController();

// sendMessage function
  void sendMessage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userToken = prefs.getString('userToken');
    final apiService = SendMessageServiceApi();
    final token = userToken;
    final messageRequest = MessageRequest(
      receiverId: '6567780f54691f117a90f0ee',
      content: 'Hello',
    );

    try {
      final response = await apiService.sendMessage(token!, messageRequest);
      print('Success: ${response.success}');
      print('Message: ${response.message}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    socketIOService.disconnect();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.only(
            top: 10.0), // Adjust the top padding to increase the height
        child: Column(
          children: [
            CupertinoNavigationBar(
              leading: ProfileHeader(fullName: widget.suggestion.fullName),
              backgroundColor: CupertinoColors.systemBackground,
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onLongPress: () {
                                print('button pressed');
                                // PullDownButton(
                                //   itemBuilder: (context) => [
                                //     PullDownMenuItem(
                                //       title: 'Menu item',
                                //       onTap: () {},
                                //     ),
                                //     const PullDownMenuDivider(),
                                //     PullDownMenuItem(
                                //       title: 'Menu item 2',
                                //       onTap: () {},
                                //     ),
                                //   ],
                                //   buttonBuilder: (context, showMenu) =>
                                //       CupertinoButton(
                                //     onPressed: showMenu,
                                //     padding: EdgeInsets.zero,
                                //     child: const Icon(
                                //         CupertinoIcons.ellipsis_circle),
                                //   ),
                                // );
                              },
                              child: Container(
                                // change boarder color

                                margin: EdgeInsets.only(
                                    left: _messages[index]['from'] == 'sender'
                                        ? 80
                                        : 5,
                                    right: _messages[index]['from'] == 'sender'
                                        ? 5
                                        : 80,
                                    top: _messages[index]['from'] == 'sender'
                                        ? 10
                                        : 2,
                                    bottom: 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _messages[index]['from'] == 'sender'
                                        ? Colors.black
                                        : Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: _messages[index]['from'] == 'sender'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                child: Text(
                                  _messages[index]['message'],
                                  style: TextStyle(
                                    // backgroundColor: themeColor1,
                                    // sender text color in black color
                                    color: _messages[index]['from'] == 'sender'
                                        ? Colors.black
                                        : Colors.white,
                                    // color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: CupertinoColors.systemBackground,
                border: Border(
                  top: BorderSide(
                    color: CupertinoColors.systemGrey,
                    width: 0.5,
                  ),
                ),
              ),
              // Search bar portion of the whole screen
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              // color: CupertinoColors.systemBackground,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: CupertinoTextField(
                          // open soft keyboard on focus
                          autofocus: true,
                          controller: userMessageController,
                          placeholder: 'Type a message',
                          decoration: const BoxDecoration(
                            color: CupertinoColors.systemBackground,
                          ),
                          // on submitted
                          onSubmitted: (value) {}),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: CupertinoButton(
                      onPressed: () {
                        // save the message to the list
                        _messages.add({
                          'message': userMessageController.text,
                          'from': 'sender',
                        });
                        // clear the text field
                        userMessageController.clear();
                        setState(() {});

                        // send the message to the server
                        sendMessage();
                      },
                      child: const Icon(
                        CupertinoIcons.paperplane_fill,
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  var fullName;

  ProfileHeader({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          color: Colors.black,
          onPressed: () {
            // navigate to previous screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FriendsSuggestionPage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
          ),
        ),
        SizedBox(width: 18),
        CircleAvatar(
          radius: 20,
          // Replace with your image
        ),
        SizedBox(width: 8),
        // show the name of the user

        Text(
          fullName, // Replace with the user's name
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
