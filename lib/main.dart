import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:h2o/provider/auth_token_provider.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51Oda4PHSvDuMR6pwhSgqNrMgZNSlmr4LUGSGwPSuUpG7ns3YltEjeTW7oOIGOkKk8EmY7yt8MnxRXzhRin0sxqcR0045cbxygI';
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    final prefs = await SharedPreferences.getInstance();
    final userJsonString = prefs.getString('data');

    runApp(MyApp(
      initialRoute: userJsonString != null ? 'home' : 'login',
    ));
  });
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthTokenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        home: initialRoute == 'login' ? SplashScreen() : Home(),
      ),
    );
  }
}








// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:h2o/provider/auth_token_provider.dart';
// import 'package:h2o/screens/home_screen/home_screen.dart';
// import 'package:h2o/screens/splash_screen/splash_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   // Ensure that Flutter binding is initialized
//   WidgetsFlutterBinding.ensureInitialized();
//   Stripe.publishableKey = 'pk_test_51Oda4PHSvDuMR6pwhSgqNrMgZNSlmr4LUGSGwPSuUpG7ns3YltEjeTW7oOIGOkKk8EmY7yt8MnxRXzhRin0sxqcR0045cbxygI';
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) async {
//     final prefs = await SharedPreferences.getInstance();
//     final userJsonString = prefs.getString('data');

//     runApp(MyApp(
//       initialRoute: userJsonString != null ? 'home' : 'login',
//     ));
//   });
// }

// class MyApp extends StatelessWidget {
//   final String initialRoute;

//   const MyApp({
//     super.key,
//     required this.initialRoute,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (context) => AuthTokenProvider()),
//         ],
//         child: CupertinoApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: const CupertinoThemeData(
//             // Set a light theme explicitly
//             brightness: Brightness.light,
//             // Add other theme properties as needed
//           ),
//           home: initialRoute == 'login' ? SplashScreen() : Home(),
//         ));
//   }
// }

