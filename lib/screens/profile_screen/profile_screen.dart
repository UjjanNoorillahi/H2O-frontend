import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // add navigation back button
        navigationBar: CupertinoNavigationBar(
          middle: Text('Profile'),
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
