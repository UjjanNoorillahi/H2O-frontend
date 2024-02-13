import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:h2o/provider/auth_token_provider.dart';
import 'package:h2o/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());

  //     .then((_) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userJsonString = prefs.getString('data');
  //
  //   runApp(
  //     MyApp(
  //       initialRoute: userJsonString != null ? 'home' : 'login',
  //     ),
  //   );
  // });
}

class MyApp extends StatelessWidget {
  // final String initialRoute;

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthTokenProvider()),
        ],
        child: const CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: CupertinoThemeData(
            // Set a light theme explicitly
            brightness: Brightness.light,
            // Add other theme properties as needed
          ),
          home: SplashScreen(),
        ));
  }
}

// Widget _buildApp() {
//   if (Platform.isIOS) {
//     return CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: CupertinoThemeData(
//         // Set a light theme explicitly
//         brightness: Brightness.light,
//         // Add other theme properties as needed
//       ),
//       home: SplashScreen(),
//     );
//   } else {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Set a light theme explicitly
//         brightness: Brightness.light,
//         // Add other theme properties as needed
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:h2o/screens/auth/login_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: LoginScreen());
//   }
// }
