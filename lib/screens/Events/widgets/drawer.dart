import 'package:flutter/material.dart';
import 'package:h2o/screens/Events/event_registartion/event_reg_screen.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/sign_up_screen.dart';
import '../booked_events_screen.dart';

class CupertinoDrawer extends StatelessWidget {
  bool adminRole = false;
  CupertinoDrawer({super.key, required this.adminRole});
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

            // create event button only for admins
            adminRole!
                ? TextButton(
                    onPressed: () {
                      // Implement the action for Past Event
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const EventRegistrationScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.event_note, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Create Event',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
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
