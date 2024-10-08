import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2o/Services/user_data_service.dart';
import 'package:h2o/models/user_data_model.dart';
import 'package:h2o/screens/CalanderScreen/calander_screen.dart';
import 'package:h2o/screens/Dashboard/dashboard.dart';
import 'package:h2o/screens/Events/Repository%20/get_event_repository.dart';
import 'package:h2o/screens/Events/events_screen.dart';
import 'package:h2o/screens/Events/service/get_event_service.dart';
import 'package:h2o/screens/Events/widgets/drawer.dart';
import 'package:h2o/screens/auth/login_screen.dart';
import 'package:h2o/screens/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;
  int _selectedIndex = 0;

  List<String> _screenTitles = ['Home', 'Events', 'Calendar', 'Profile'];

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _closeDrawer() {
    if (_isDrawerOpen) {
      setState(() {
        _isDrawerOpen = false;
      });
    }
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
    // Call getUserData() here if needed
  }

  @override
  Widget build(BuildContext context) {
    final EventRepository eventRepository = EventRepository(
      EventService(),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_screenTitles[_selectedIndex]),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleDrawer,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp, color: Colors.black),
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove('userToken');

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _closeDrawer, // Close drawer when tapping outside
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                DashboardScreen(),
                EventScreen(),
                CalanderScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isDrawerOpen ? 0 : -250,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  _closeDrawer(); // Swipe to the right to close
                }
              },
              child: CupertinoDrawer(
                adminRole: true,
              ),
            ),
          ),
        ],
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
