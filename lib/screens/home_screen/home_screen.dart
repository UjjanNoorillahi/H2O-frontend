import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/screens/Events/Repository%20/get_event_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/user_data_service.dart';
import '../../models/user_data_model.dart';
import '../CalanderScreen/calander_screen.dart';
import '../Dashboard/dashboard.dart';
import '../Events/events_screen.dart';
import '../Events/service/get_event_service.dart';
import '../Events/widgets/drawer.dart';
import '../auth/login_screen.dart';
import '../profile_screen/profile_screen.dart';

class Home extends StatefulWidget {
  bool isAdmin;
  Home({super.key, required this.isAdmin});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  List _screens = [
    const EventScreen(),
    const CalanderScreen(),
    const ProfileScreen(),
  ];

  String? userRole;

  List<String> _screenTitles = [];

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  // get user data
  getUserData() async {
    //widget.isAdmin == false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('userToken');
    userRole = prefs.getString('role') ?? '';

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
    _screens = widget.isAdmin
        ? [
            const DashboardScreen(),
            const EventScreen(),
            const CalanderScreen(),
            const ProfileScreen(),
          ]
        : [
            const EventScreen(),
            const CalanderScreen(),
            const ProfileScreen(),
          ];

    _screenTitles = widget.isAdmin
        ? ['Home', 'Events', 'Calendar', 'Profile']
        : ['Events', 'Calendar', 'Profile'];
  }

  @override
  Widget build(BuildContext context) {
    final EventRepository eventRepository = EventRepository(
      EventService(),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          _screenTitles[_selectedIndex],
          style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Adamina-Regular',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: _toggleDrawer,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp, color: Colors.white),
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.clear();

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (Route route) => false,
              );
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      drawer: CupertinoDrawer(
        adminRole: widget.isAdmin,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white, // Ensure a contrasting background color
        selectedItemColor: Colors.black, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),

        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
