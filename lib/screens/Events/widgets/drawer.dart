import 'package:flutter/material.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/sign_up_screen.dart';
import '../booked_events_screen.dart';

class CupertinoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              color: Colors.black,
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  Image.asset('assets/logo/logo.png', height: 100, width: 80),
                  const Text(
                    'H2OEvents',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BookedEventsScreen(),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.event_seat, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Booked Event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement the action for Past Event
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.history, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Past Event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.remove('userToken');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:h2o/screens/auth/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../auth/sign_up_screen.dart';
// import '../booked_events_screen.dart';

// class CupertinoDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.6,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.black,
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height * 0.14,
//               color: CupertinoColors.black,
//               alignment: Alignment.center,
//             ),
//             Container(
//               color: CupertinoColors.black,
//               child: Row(
//                 children: [
//                   Container(
//                       child: Image.asset('assets/logo/logo.png',
//                           height: 100, width: 80)),
//                   const Text('H2OEvents',
//                       style: TextStyle(
//                           color: CupertinoColors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(CupertinoIcons.moon_stars_fill,
//                       color: CupertinoColors.white),
//                   SizedBox(width: 10),
//                   Text('View Event',
//                       style: TextStyle(
//                           color: CupertinoColors.white,
//                           fontSize: 19,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => const BookedEventsScreen(),
//                   ),
//                 );
//               },
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const BookedEventsScreen(),
//                     ),
//                   );
//                 },
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(CupertinoIcons.tickets, color: CupertinoColors.white),
//                     SizedBox(width: 10),
//                     Text('Booked Event',
//                         style: TextStyle(
//                             color: CupertinoColors.white,
//                             fontSize: 19,
//                             fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//               ),
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 // Navigator.pop(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(CupertinoIcons.timer, color: CupertinoColors.white),
//                   SizedBox(width: 10),
//                   Text('Past Event',
//                       style: TextStyle(
//                           color: CupertinoColors.white,
//                           fontSize: 19,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//             CupertinoButton(
//               onPressed: () async {
//                 final SharedPreferences prefs =
//                     await SharedPreferences.getInstance();
//                 prefs.remove('userToken');
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(Icons.logout, color: CupertinoColors.white),
//                   SizedBox(width: 10),
//                   Text('Logout',
//                       style: TextStyle(
//                           color: CupertinoColors.white,
//                           fontSize: 19,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
