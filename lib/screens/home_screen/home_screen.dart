import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/user_data_service.dart';
import '../../models/user_data_model.dart';
import '../CalanderScreen/calander_screen.dart';
import '../Dashboard/dashboard.dart';
import '../Events/Repository /get_event_repository.dart';
import '../Events/events_screen.dart';
import '../Events/service/get_event_service.dart';
import '../Events/widgets/drawer.dart';
import '../auth/login_screen.dart';
import '../profile_screen/profile_screen.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;
  int _selectedIndex = 0;

  List<String> _screenTitles = ['Home', 'Events', 'Calendar', 'Profile'];

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  // get user data
  getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');

    UserDataService userDataService = UserDataService();
    UserData? userData = await userDataService.getUserData("", userToken!);
    if (userData != null) {
      print("User data: $userData");
    } else {
      print("Error getting user data.");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EventRepository eventRepository = EventRepository(

      EventService(),
    );
//TODO : Need to design teh screens in this fashion
    // return SafeArea(
    //   child: Scaffold(
    //     appBar: ,
    //     bottomNavigationBar: ,
    //     drawer: ,
    //   ),
    // );
return
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_screenTitles[_selectedIndex]),
        leading: GestureDetector(
          onTap: _toggleDrawer,
          child: Icon(CupertinoIcons.bars),
        ),
        trailing: GestureDetector(
          onTap: () async {

            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('userToken');

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.logout_sharp,
            color: Colors.black,
          ),
        ),
      ),
      child: Stack(
        children: [
          CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              activeColor: Colors.black,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.moon_stars_fill), label: "Events"),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: "Calendar"),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profile"),
              ],
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return DashboardScreen();
                case 1:
                  return EventScreen();
                case 2:
                  return CalanderScreen();
                case 3:
                  return ProfileScreen();
                default:
                  return LoginScreen();
              }
            },
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _isDrawerOpen ? 0 : -250,
            top: 0,
            bottom: 0,
            child: CupertinoDrawer(),
          ),
        ],
      ),
    );
  }
}
