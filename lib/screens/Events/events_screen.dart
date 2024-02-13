import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/const.dart';
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
          middle: Text('Events'),
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Music Feature
                Container(
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
                              child: Image.asset(
                                  'assets/images/art-etvin-photo-dr.jpg',
                                  height: 300,
                                  width: 350),
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
                            child: const Column(
                              children: [
                                Text(
                                  'Art and Wine Expo',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '  Explore stunning artworks while savoring \n  a selection of fine wines.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),

                // Vehicle Feature
                Container(
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
                              child: Image.asset(
                                'assets/images/summer_music_festival.jpg',
                                height: 300,
                                width: 350,
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                color: Colors
                                    .black, // Set the border color to black
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'Summer Music Festival',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '   An outdoor festival celebrating music from\n   various genres.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),

                // Vehicle Feature
                Container(
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
                              child: Image.asset(
                                'assets/images/international_film_festival.jpeg',
                                height: 300,
                                width: 350,
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                color: Colors
                                    .black, // Set the border color to black
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'International Film Festival',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Screening of award-winning films\n from around the world.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),

                // Vehicle Feature
                Container(
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
                              child: Image.asset(
                                'assets/images/iot_tech_expo.jpg',
                                height: 300,
                                width: 350,
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                color: Colors
                                    .black, // Set the border color to black
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'Tech Expo 2023',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '   A showcase of cutting-edge technology ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
