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

import 'package:flutter/material.dart';
import 'package:h2o/screens/connected_friends_screen.dart';

import '../models/get_user_data_model.dart';

class ChatScreen extends StatefulWidget {
  final FriendSuggestion suggestion;

  const ChatScreen({super.key, required this.suggestion});

  static const String screen_id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _lastMsgIsRecieved = true;
  int count = 0;
  double _topMarginofTile = 0;

  @override
  Widget build(BuildContext context) {
    print('Hello printing ...... $_lastMsgIsRecieved');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const ConnectedFriendsScreen()),
            );
          },

          //=> Navigator.pop(context),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
              CircleAvatar(
                // radius: 22,
                backgroundImage: NetworkImage(''),
              ),
            ],
          ),
        ),
        leadingWidth: 70,

        title: GestureDetector(
          onTap: () {},
          // Navigator.pushNamed(context, InstructorInfoScreen.screen_id),
          child: Text(
            widget.suggestion.fullName,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: Container(
        //     height: 500,
        //     width: 500,
        //     // padding: const EdgeInsets.only(left: 10),
        //     // color: Colors.red,
        //     child: Icon(
        //       Icons.arrow_back_ios_sharp,
        //     ),
        //   ),
        // ),
        // leading: Container(
        //   color: Colors.red,
        //   margin: EdgeInsets.only(left: 10),
        //   child: Icon(
        //     Icons.arrow_back_ios_sharp,
        //   ),
        // ),

        // title: Container(
        //   color: Colors.green,
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 0),
        //         child: CircleAvatar(
        //           backgroundImage: NetworkImage(
        //               'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 10),
        //         child: Text(
        //           'Name',
        //           style: TextStyle(
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: '1',
                child: Text('option 1'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 2'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 3'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 14.0, right: 14.0),
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 60,
          ),
          // reverse: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            count++;
            print('Count : $count  ,  Index : $index');

            // if(index % 2 == 0)
            if (index % 3 == 0 || index % 4 == 0) {
              if (_lastMsgIsRecieved) {
                // _topMarginofTile = 10;
                _lastMsgIsRecieved = false;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SentMessageTile(Colors.black),
                  ],
                );
              } else {
                // _topMarginofTile = 2;
                _lastMsgIsRecieved = false;
                return Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    SentMessageTile(Colors.black),
                  ],
                );
              }
              // _lastMsgIsRecieved = false;
              // return SentMessageTile(themeColor2);
            } else {
              if (_lastMsgIsRecieved) {
                // _topMarginofTile = 2;
                _lastMsgIsRecieved = true;
                return Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    RecievedMessageTile(Colors.black),
                  ],
                );
              } else {
                _lastMsgIsRecieved = true;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RecievedMessageTile(Colors.black),
                  ],
                );
              }
            }
          },
        ),
      ),
      bottomSheet: Container(
        // margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    // spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(4, 4),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIconColor: Colors.black,
                  suffixIconColor: Colors.black,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.emoji_emotions_rounded),
                    onTap: () {
                      // Fluttertoast.showToast(msg: 'Emoji Icon Pressed');
                    },
                  ),
                  hintText: 'Messaage',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 20,
                  ),
                  suffixIcon: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Transform.rotate(
                        angle: -135 * (3.14159265359 / 180),
                        child: Icon(
                          Icons.attachment,
                          size: 28,
                        ),
                      ),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: SvgPicture.asset('assets/icons/attachment.svg'),
                    // ),
                    // child: Icon(),
                    onTap: () {
                      // Fluttertoast.showToast(msg: 'Attachment Clicked!');
                    },
                  ),
                  suffixIconConstraints: BoxConstraints(
                      // maxHeight: double.infinity,
                      // maxWidth: double.infinity,
                      ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  // height: 0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Fluttertoast.showToast(msg: 'Sent Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: Icon(
                Icons.send,

                color: Colors.black,
                size: 30, // Icon size
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row SentMessageTile(Color themeColor2) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('--------------------------------------------');
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
      _lastMsgIsRecieved = false;
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
    });
    // EdgeInsets messageTileMargin;
    // if (_lastMsgIsRecieved) {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 10, bottom: 0);
    // } else {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 2, bottom: 0);
    // }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin:
                const EdgeInsets.only(left: 80, right: 5, top: 0, bottom: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeColor2,
            ),
            child: Text(
              'swqd a asdad asd a s',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row RecievedMessageTile(Color themeColor1) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('----------------------------------------------------');
      _lastMsgIsRecieved = true;
    });
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin:
                const EdgeInsets.only(left: 5, right: 80, top: 0, bottom: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: Text(
              'swqd a sdad asdasdsaa asdbsdsakbda dsa sda dajdald lasjdlwihaasdhasd dna sdasdaodjnas sasdasdasda',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
