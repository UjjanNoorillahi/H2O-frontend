// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../constant/const.dart';
// import '../home_screen/home_screen.dart';
//
// class EventsScreen extends StatefulWidget {
//   const EventsScreen({super.key});
//
//   @override
//   State<EventsScreen> createState() => _EventsScreenState();
// }
//
// class _EventsScreenState extends State<EventsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         // add navigation back button
//         navigationBar: CupertinoNavigationBar(
//           middle: Text('Events'),
//           leading: CupertinoNavigationBarBackButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => const Home(),
//                 ),
//               );
//             },
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Music Feature
//                 Container(
//                     width: MediaQuery.of(context).size.width *
//                         0.9, // Take up the entire screen width
//
//                     height: MediaQuery.of(context).size.height /
//                         3, // One-third// of the screen height
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.black,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             height: MediaQuery.of(context).size.height / 4.2,
//                             child: Container(
//                               // child: NetworkImage,
//                               child: Image.asset(
//                                   'assets/images/art-etvin-photo-dr.jpg',
//                                   height: 300,
//                                   width: 350),
//                             )),
//                         Expanded(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width *
//                                 0.9, // Take up the entire screen width
//                             height: MediaQuery.of(context).size.height /
//                                 6, // One-third// of the screen height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.all(
//                                 Radius.circular(30),
//                               ),
//                               border: Border.all(
//                                 color: Colors
//                                     .black, // Set the border color to black
//                                 width: 2.0, // Set the border width
//                               ),
//                             ),
//                             child: const Column(
//                               children: [
//                                 Text(
//                                   'Art and Wine Expo',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '  Explore stunning artworks while savoring \n  a selection of fine wines.',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//
//                 // Vehicle Feature
//                 Container(
//                     width: MediaQuery.of(context).size.width *
//                         0.9, // Take up the entire screen width
//
//                     height: MediaQuery.of(context).size.height /
//                         3, // One-third// of the screen height
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.black,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             height: MediaQuery.of(context).size.height / 4.2,
//                             child: Container(
//                               // child: NetworkImage,
//                               child: Image.asset(
//                                 'assets/images/summer_music_festival.jpg',
//                                 height: 300,
//                                 width: 350,
//                               ),
//                             )),
//                         Expanded(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width *
//                                 0.9, // Take up the entire screen width
//                             height: MediaQuery.of(context).size.height /
//                                 6, // One-third// of the screen height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30),
//                               ),
//                               border: Border.all(
//                                 color: Colors
//                                     .black, // Set the border color to black
//                                 width: 2.0, // Set the border width
//                               ),
//                             ),
//                             child: const Column(
//                               children: [
//                                 Text(
//                                   'Summer Music Festival',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '   An outdoor festival celebrating music from\n   various genres.',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//
//                 // Vehicle Feature
//                 Container(
//                     width: MediaQuery.of(context).size.width *
//                         0.9, // Take up the entire screen width
//
//                     height: MediaQuery.of(context).size.height /
//                         3, // One-third// of the screen height
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.black,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             height: MediaQuery.of(context).size.height / 4.2,
//                             child: Container(
//                               // child: NetworkImage,
//                               child: Image.asset(
//                                 'assets/images/international_film_festival.jpeg',
//                                 height: 300,
//                                 width: 350,
//                               ),
//                             )),
//                         Expanded(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width *
//                                 0.9, // Take up the entire screen width
//                             height: MediaQuery.of(context).size.height /
//                                 6, // One-third// of the screen height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30),
//                               ),
//                               border: Border.all(
//                                 color: Colors
//                                     .black, // Set the border color to black
//                                 width: 2.0, // Set the border width
//                               ),
//                             ),
//                             child: const Column(
//                               children: [
//                                 Text(
//                                   'International Film Festival',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Screening of award-winning films\n from around the world.',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//
//                 // Vehicle Feature
//                 Container(
//                     width: MediaQuery.of(context).size.width *
//                         0.9, // Take up the entire screen width
//
//                     height: MediaQuery.of(context).size.height /
//                         3, // One-third// of the screen height
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.black,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                             ),
//                             height: MediaQuery.of(context).size.height / 4.2,
//                             child: Container(
//                               // child: NetworkImage,
//                               child: Image.asset(
//                                 'assets/images/iot_tech_expo.jpg',
//                                 height: 300,
//                                 width: 350,
//                               ),
//                             )),
//                         Expanded(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width *
//                                 0.9, // Take up the entire screen width
//                             height: MediaQuery.of(context).size.height /
//                                 6, // One-third// of the screen height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(30),
//                               ),
//                               border: Border.all(
//                                 color: Colors
//                                     .black, // Set the border color to black
//                                 width: 2.0, // Set the border width
//                               ),
//                             ),
//                             child: const Column(
//                               children: [
//                                 Text(
//                                   'Tech Expo 2023',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '   A showcase of cutting-edge technology ',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: primaryFont,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ));
//
// }
//   }
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:h2o/screens/Events/event_details_screen.dart';
import 'package:h2o/screens/Events/models/get_event_model_class.dart';
import 'package:h2o/screens/Events/service/get_event_service.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

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
    return CupertinoPageScaffold(
      // add navigation back button


      child:   FutureBuilder<List<Event>>(
        future: eventRepository.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator(
              radius: 17,
              color: Colors.black,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Event event = snapshot.data![index];

                String isoDate =  event.date.toString();
                DateTime date = DateTime.parse(isoDate);

                // Set up the format you want
                DateFormat formatter = DateFormat('MM-dd-yyyy');  // Example: 2024-02-22
                String formattedDate = formatter.format(date);

                print(formattedDate);  // Output: 2024-02-22
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(event: event),
                        ),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // Take up the entire screen width

                        height: MediaQuery.of(context).size.height /
                            3, // One-third// of the screen height
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                ),
                                height: MediaQuery.of(context).size.height / 4.2,
                                child: Container(
                                  // child: NetworkImage,
                                  child: Image.network(
                                      event.images.isEmpty ? "https://res.cloudinary.com/dx3kgoad5/image/upload/v1707300650/images/1707300647385.webp" :event.images[0].toString()
                                    // 'https://res.cloudinary.com/dx3kgoad5/image/upload/v1715459813/images/1715459813550.png,',
                                    // height: 300,
                                    // width: 350,
                                  ),
                                )),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.9, // Take up the entire screen width
                                height: MediaQuery.of(context).size.height /
                                    6, // One-third// of the screen height
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  border: Border.all(
                                    color: Colors
                                        .black, // Set the border color to black
                                    width: 2.0, // Set the border width
                                  ),
                                ),
                                child:  Column(
                                  children: [
                                    Text(
                                      event.title.toString(), overflow: TextOverflow.ellipsis, maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '  $formattedDate',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.only(left: 17.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          event.time.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No events found'));
          }
        },
      ),
    );
  }
}
