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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
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






// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:h2o/constant/const.dart';
// import 'package:h2o/screens/Events/service/booked_event_service.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// import 'booked_event_details_screen.dart';
// import 'event_details_screen.dart';
// import 'models/booked_event_model.dart';

// class BookedEventsScreen extends StatefulWidget {
//   const BookedEventsScreen({super.key});

//   @override
//   State<BookedEventsScreen> createState() => _BookedEventsScreenState();
// }

// class _BookedEventsScreenState extends State<BookedEventsScreen> {
//   late BookedEventService apiService;
//   List<Event> bookedEvents = [];
//   bool isLoading = true; // Track loading state

//   @override
//   void initState() {
//     super.initState();
//     apiService = BookedEventService(
//       baseUrl: BASE_URL,
//     );
//     _fetchBookedEvents();
//   }

//   Future<void> _fetchBookedEvents() async {
//     try {
//       List<Event> events = await apiService.getBookedEvents();
//       setState(() {
//         bookedEvents = events;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Booked Events'),
//       ),
//       child: isLoading
//           ? const Center(child: CupertinoActivityIndicator(radius: 15)) // iOS style loader
//           : bookedEvents.isNotEmpty
//           ? ListView.builder(
//         itemCount: bookedEvents.length,
//         itemBuilder: (context, index) {
//           final event = bookedEvents[index];

//           String isoDate =  event.date.toString();
//           DateTime date = DateTime.parse(isoDate);

//           // Set up the format you want
//           DateFormat formatter = DateFormat('MM-dd-yyyy');  // Example: 2024-02-22
//           String formattedDate = formatter.format(date);

//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: GestureDetector(
//               onTap: () {

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BookedEventDetailsScreen(event: event),
//                   ),
//                 );

//               },
//               child: Container(
//                   width: MediaQuery.of(context).size.width *
//                       0.9, // Take up the entire screen width

//                   height: MediaQuery.of(context).size.height /
//                       3, // One-third// of the screen height
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.black,
//                             borderRadius:
//                             BorderRadius.all(Radius.circular(30)),
//                           ),
//                           height: MediaQuery.of(context).size.height / 4.2,
//                           child: Container(
//                             // child: NetworkImage,
//                             child: Image.network(
//                                 event.images.isEmpty ? "https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp" :event.images[0].toString()
//                               // 'https://res.cloudinary.com/dx3kgoad5/image/upload/v1715459813/images/1715459813550.png,',
//                               // height: 300,
//                               // width: 350,
//                             ),
//                           )),
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width *
//                               0.9, // Take up the entire screen width
//                           height: MediaQuery.of(context).size.height /
//                               6, // One-third// of the screen height
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(30),
//                             ),
//                             border: Border.all(
//                               color: Colors
//                                   .black, // Set the border color to black
//                               width: 2.0, // Set the border width
//                             ),
//                           ),
//                           child:  Column(
//                             children: [
//                               Text(
//                                 event.title.toString(), overflow: TextOverflow.ellipsis, maxLines: 1,
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: primaryFont,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10.0),
//                                 child: Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     '  $formattedDate',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontFamily: primaryFont,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ),


//                               Padding(
//                                 padding: const EdgeInsets.only(left: 17.0),
//                                 child: Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     event.time.toString(),
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: primaryFont,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//               ),
//             ),
//           );
//           // return Container(
//           //   child: Column(
//           //     children: [
//           //       Text(event.title),
//           //       Text(event.description),
//           //
//           //     ],
//           //   ),
//           // );
//         },
//       )
//           : Center(child: Text('No booked events')),
//     );
//   }
// }
