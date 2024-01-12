import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/constant/const.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:h2o/screens/friends_screen/friends_suggestion_screen.dart';
import 'package:h2o/screens/home_screen/widgets/black_balance_card.dart';
import 'package:h2o/screens/home_screen/widgets/grey_monthly_amount_card.dart';
import 'package:h2o/screens/home_screen/widgets/long_term_goal_card.dart';
import 'package:h2o/screens/home_screen/widgets/short_term_goal_card.dart';
import 'package:h2o/screens/profile_screen/profile_screen.dart';
import 'package:h2o/screens/wallet_screen/wallet_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/user_data_service.dart';
import '../../models/user_data_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String availableBalance = '3,578';
  double currentBalance = 4000;
  double availableBalanceText = 2478;

  // get user data
  getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    UserDataService userDataService = UserDataService();
    UserData? userData = await userDataService.getUserData(userToken!);
    if (userData != null) {
      // log(userData.toString());
      print("User data: $userData");
      print(userData.fullName);
      log(userData.toString());
      // Store user data in provider
      // Provider.of<UserDataStorage>(context, listen: false).userData = userData;
    } else {
      print("Error getting user data.");
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // add Cupertino app bar
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Dashboard'),
        // add logout button
        trailing: CupertinoButton(
          onPressed: () {
            // await getUserData();
            // Add your logout logic here
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          child: const Icon(
            CupertinoIcons.person_crop_circle_badge_xmark,
            color: Colors.black,
          ),
        ),
      ),
      child: CupertinoTabScaffold(
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
          onTap: (index) {
            // Handle your navigation logic here
            // create a switch statement to handle the navigation
            switch (index) {
              case 0:
                // navigate to the Home screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );

                break;
              case 1:
                // Navigate to the Chat screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => FriendsSuggestionPage(),
                  ),
                );
                break;
              case 2:
                // Navigate to the Wallet screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => WalletScreen(),
                  ),
                );
                break;
              case 3:
                // Navigate to the Profile screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
                break;
            }
          },
        ),
        tabBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Center(
              child: Column(
                children: [
                  // Your existing widgets go here
                  //Black Balance Card
                  BlackBalanceCardWidget(availableBalance: availableBalance),

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 24.0, top: 3),
                                  child: SizedBox(
                                    width: 186,
                                    height: 20,
                                    child: Row(
                                      children: [
                                        Text(
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
          );
        },
      ),
    );
  }
}
