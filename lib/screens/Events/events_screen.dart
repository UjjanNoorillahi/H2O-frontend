import 'package:flutter/material.dart';
import 'package:h2o/res/components/image_with_overlay.dart';
import 'package:h2o/screens/Events/Repository%20/get_event_repository.dart';
import 'package:h2o/screens/Events/event_details_screen.dart';
import 'package:h2o/screens/Events/service/get_event_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/const.dart';
import '../home_screen/home_screen.dart';
import 'models/get_event_model_class.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventRepository eventRepository = EventRepository(EventService());
  String token = '';

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');
    setState(() {
      token = userToken!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Event>>(
        future: eventRepository.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Event event = snapshot.data![index];

                String isoDate = event.date.toString();
                DateTime date = DateTime.parse(isoDate);

                DateFormat formatter = DateFormat('MM-dd-yyyy');
                String formattedDate = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(event: event),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ImageWithOverlayText(
                        imageUrl: event.images.isEmpty
                            ? "https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp"
                            : event.images[0].toString(),
                        title: event.title.toString(),
                        date: formattedDate,
                        imageHeight: MediaQuery.of(context).size.height / 2.8,
                        containerWidth: MediaQuery.of(context).size.width * 0.9,
                        borderRadius: 30.0,
                        overlayColor: Colors.white,
                        titleStyle: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                        dateStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No events found'));
          }
        },
      ),
    );
  }
}
