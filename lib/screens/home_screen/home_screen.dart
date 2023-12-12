import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/home_screen/widgets/black_balance_card.dart';
import 'package:h2o/screens/home_screen/widgets/grey_monthly_amount_card.dart';
import 'package:h2o/screens/home_screen/widgets/long_term_goal_card.dart';
import 'package:h2o/screens/home_screen/widgets/short_term_goal_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String availableBalance = '3,578';
  double currentBalance = 4000;
  double availableBalanceText = 2478;
  @override
  Widget build(BuildContext context) {
    // add Cupertino app bar
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar_circle),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: const CupertinoNavigationBar(
                  middle: Text('Dashboard'),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Center(
                    child: Column(
                      children: [
                        // Your existing widgets go here
                        //Black Balance Card
                        BlackBalanceCardWidget(
                            availableBalance: availableBalance),

                        const SizedBox(
                          height: 12,
                        ),

                        // Grey Balance Card
                        GreyBalanceCardWidget(
                          currentBalance: currentBalance,
                          availableBalanceText: availableBalanceText,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        // short term goals text
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 24.0, top: 3),
                                child: SizedBox(
                                  width: 186,
                                  height: 20,
                                  child: Text(
                                    'Short term goals:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: primaryFont,
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Short Term Goals Cards
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Short Term Goals Cards 1 (Daily Priority)
                                ShortTermGoalWidget(
                                  goal: "Daily Priority",
                                  goalDescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ShortTermGoalWidget(
                                  goal: "Weekly Priority",
                                  goalDescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ShortTermGoalWidget(
                                  goal: "Monthly Priority",
                                  goalDescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
                                ),

                                const SizedBox(
                                  height: 35,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 24.0, top: 3),
                                        child: SizedBox(
                                          width: 186,
                                          height: 20,
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Long term goals:',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontFamily: primaryFont,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.09,
                                                ),
                                              ),
                                              const Spacer(),
                                              // TextButton(
                                              //   onPressed: () {},
                                              //   child: const Text(
                                              //     'Add',
                                              //     textAlign: TextAlign.left,
                                              //     style: TextStyle(
                                              //       color: Colors.black,
                                              //       fontSize: 17,
                                              //       fontFamily: primaryFont,
                                              //       fontWeight: FontWeight.w400,
                                              //       height: 0.09,
                                              //     ),
                                              //   ),
                                              // ),
                                              // Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                LongTermGoalWidget(
                                  goal: "Buying an Apartment",
                                  goalADescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LongTermGoalWidget(
                                  goal: "Saving for a Car",
                                  goalADescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LongTermGoalWidget(
                                  goal: "Saving for a Vacation Trip",
                                  goalADescription:
                                      'Lorem ipsum dolor sit amet, consectetur adipisci.',
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
          );
        },
      ),
    );
  }
}

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Dashboard',
//       home: MyCustomTabBar(),
//     );
//   }
// }
//
// class MyCustomTabBar extends StatefulWidget {
//   @override
//   _MyCustomTabBarState createState() => _MyCustomTabBarState();
// }
//
// class _MyCustomTabBarState extends State<MyCustomTabBar> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: _buildTabContent(),
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.blueAccent,
//         items: <Widget>[
//           Icon(CupertinoIcons.home, size: 30),
//           Icon(Icons.wallet, size: 30),
//           Icon(CupertinoIcons.person, size: 30),
//           Icon(CupertinoIcons.chat_bubble_2_fill, size: 30),
//         ],
//         onTap: (index) {
//           //Handle button tap
//         },
//       ),
//
//       // _buildCustomTabBar(),
//     );
//   }
//
//   Widget _buildTabContent() {
//     switch (_currentIndex) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return ChatScreen();
//       case 2:
//         return WalletScreen();
//       case 3:
//         return ProfileScreen();
//       default:
//         return Container();
//     }
//   }
//
//   Widget _buildCustomTabBar() {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       items: const [
//         BottomNavigationBarItem(
//           backgroundColor: Colors.black,
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.chat_bubble_outline),
//           label: 'Chat',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_balance_wallet),
//           label: 'Wallet',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Home Screen'));
//   }
// }
//
// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Chat Screen'));
//   }
// }
//
// class WalletScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Wallet Screen'));
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Profile Screen'));
//   }
// }
