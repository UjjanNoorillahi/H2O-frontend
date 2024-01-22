import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // add navigation back button
        navigationBar: CupertinoNavigationBar(
          middle: Text('Wallet'),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
        ),
        child: const Center(
          child: Text('Profile features coming soon...'),
        ));
  }
}
