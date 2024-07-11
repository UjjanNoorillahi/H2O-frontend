import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:image_card/image_card.dart';

import '../home_screen/home_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
            
                // Music Feature
                Container(
                  width: MediaQuery.of(context).size.width * 0.9, // Take up the entire screen width
            
                  height: MediaQuery.of(context).size.height / 3, // One-third// of the screen height
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)
                    ),
            
                    ),
            
                  child: Column(
                    children: [
                     Container(
                       decoration: const BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.all(Radius.circular(30)
                         ),
                       ),
                       height: MediaQuery.of(context).size.height / 4.2,
            
                       child: Container(
                         // child: NetworkImage,
                         child: Image.asset('assets/logo/music_image.png',),
                       )
                     ),
                      Expanded(child: Container(
                        width: MediaQuery.of(context).size.width * 0.9, // Take up the entire screen width
                        height: MediaQuery.of(context).size.height / 6, // One-third// of the screen height
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30),
                          ),
                          border: Border.all(
                            color: Colors.black, // Set the border color to black
                            width: 2.0, // Set the border width
                          ),
            
            
                        ),
                        child: Column(
            
                          children: [
                            const Text('Music',style: TextStyle(
                              fontSize: 24,
                              fontFamily: primaryFont,
                              fontWeight: FontWeight.w400,
                            ),),
                            const Text('Coming Soon',style: TextStyle(
                              fontSize: 16,
                              fontFamily: primaryFont,
                              fontWeight: FontWeight.w400,
                            ),),
                          ],
                        ),
            
            
                      ),
                      )
                    ],
                  )
                ),
            
                const SizedBox(height: 20,),
            
                // Vehicle Feature
                Container(
                    width: MediaQuery.of(context).size.width * 0.9, // Take up the entire screen width
            
                    height: MediaQuery.of(context).size.height / 3, // One-third// of the screen height
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)
                      ),
            
                    ),
            
                    child: Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(30)
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 4.2,
            
                            child: Container(
                              // child: NetworkImage,
                              child: Image.asset('assets/logo/music_image.png',),
                            )
                        ),
                        Expanded(child: Container(
                          width: MediaQuery.of(context).size.width * 0.9, // Take up the entire screen width
                          height: MediaQuery.of(context).size.height / 6, // One-third// of the screen height
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30),
                            ),
                            border: Border.all(
                              color: Colors.black, // Set the border color to black
                              width: 2.0, // Set the border width
                            ),
            
            
                          ),
                          child: const Column(
            
                            children: [
                               Text('Music',style: TextStyle(
                                fontSize: 24,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400,
                              ),),
                               Text('Coming Soon',style: TextStyle(
                                fontSize: 16,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
            
            
                        ),
                        )
                      ],
                    )
                ),
            





              ],
            ),
          ),
        ));
  }
}
