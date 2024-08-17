import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:h2o/res/components/image_with_overlay.dart';

import 'package:h2o/screens/Events/event_details_screen.dart';
import 'package:h2o/screens/Events/event_registartion/event_reg_screen.dart';
import 'package:h2o/screens/Events/models/get_event_model_class.dart';

import 'package:h2o/screens/Events/service/get_event_service.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '';

import '../../constant/const.dart';
import '../Events/Repository /get_event_repository.dart';
import '../home_screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

String token = '';
initState() {
  getToken();
}

getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userToken = prefs.getString('userToken');
  token = userToken!;
  print(token);
}

class _DashboardScreenState extends State<DashboardScreen> {
  final EventRepository eventRepository = EventRepository(EventService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dashborad",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              titleSubtitleWidget("Total Events", "24"),
              const SizedBox(
                height: 20,
              ),
              titleSubtitleWidget("Total Users", "24"),
              const SizedBox(
                height: 20,
              ),
              titleSubtitleWidget("Revenue", r"$3435"),
              const SizedBox(
                height: 20,
              ),
              titleSubtitleWidget("Manage Events","", isButton: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleSubtitleWidget(title, subtitle,{isButton = false}) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              isButton 
              ? 
              ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const EventRegistrationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ), child: const Text(
                "Add New Event",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              )
              :
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Adamina-Regular',
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
