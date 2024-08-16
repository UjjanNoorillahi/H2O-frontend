import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/Events/service/booked_event_service.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:intl/intl.dart';

import 'booked_event_details_screen.dart';
import 'models/booked_event_model.dart';

class BookedEventsScreen extends StatefulWidget {
  const BookedEventsScreen({super.key});

  @override
  State<BookedEventsScreen> createState() => _BookedEventsScreenState();
}

class _BookedEventsScreenState extends State<BookedEventsScreen> {
  late BookedEventService apiService;
  List<Event> bookedEvents = [];
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    apiService = BookedEventService(baseUrl: BASE_URL);
    _fetchBookedEvents();
  }

  Future<void> _fetchBookedEvents() async {
    try {
      final events = await apiService.getBookedEvents();
      setState(() {
        bookedEvents = events;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching booked events: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Events'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Material style loader
          : bookedEvents.isNotEmpty
              ? ListView.builder(
                  itemCount: bookedEvents.length,
                  itemBuilder: (context, index) {
                    final event = bookedEvents[index];

                    final isoDate = event.date.toString();
                    final date = DateTime.parse(isoDate);

                    // Set up the format you want
                    final formatter = DateFormat('MM-dd-yyyy');
                    final formattedDate = formatter.format(date);

                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookedEventDetailsScreen(event: event),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.9, // Take up the entire screen width
                          height: MediaQuery.of(context).size.height /
                              3, // One-third of the screen height
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height:
                                    MediaQuery.of(context).size.height / 4.2,
                                child: Image.network(
                                  event.images.isEmpty
                                      ? "https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp"
                                      : event.images[0].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.9, // Take up the entire screen width
                                  height: MediaQuery.of(context).size.height /
                                      6, // One-sixth of the screen height
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.black, // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          event.title.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          formattedDate,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          event.time.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('No booked events')),
    );
  }
}
