import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/user_data_service.dart';
import '../../models/user_data_model.dart';
import '../home_screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  dynamic userData1;
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('data');
    String? userID = prefs.getString('userID');

    UserDataService userDataService = UserDataService();
    userData1 = await userDataService.getUserData(userID!, userToken!);
    setState(() {
      // userData1 = userData;
      isLoading = false; // Update loading state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Material style loader
            : userData1 != null
                ? Text(userData1)
                : const Text('Profile features coming soon...'),
      ),
    );
  }
}
