import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/const.dart';
import '../home_screen/home_screen.dart';

class HousingTransportScreen extends StatefulWidget {
  const HousingTransportScreen({super.key});

  @override
  State<HousingTransportScreen> createState() => _HousingTransportScreenState();
}

class _HousingTransportScreenState extends State<HousingTransportScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // add navigation back button
        navigationBar: CupertinoNavigationBar(
          middle: Text('House & Transport'),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>  Home(isAdmin: false,),
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
                              child: Icon(
                                Icons.house,
                                size: 100,
                                color: Colors.white,
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
                            child: const Column(
                              children: [
                                Text(
                                  'House',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Tap the icon to find a house',
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
                              child: Icon(
                                Icons.car_rental,
                                size: 100,
                                color: Colors.white,
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
                                  'Transport',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Tap the icon to find a transport',
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
