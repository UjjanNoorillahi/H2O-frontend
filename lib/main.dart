import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:h2o/provider/auth_token_provider.dart';
import 'package:h2o/screens/Events/event_registartion/event_reg_screen.dart';
import 'package:h2o/screens/home_screen/home_screen.dart';
import 'package:h2o/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_live_51Oda4PHSvDuMR6pwVmcCmszQnbOosphNs3Xpzl0h57BH2idPzuBRXiNgfXpuTXPHF5QPqMPHxMULCChp7fzG11R600irHtNpUs';
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    final prefs = await SharedPreferences.getInstance();
    final userJsonString = prefs.getString('data');
    final role = prefs.getString('role');

    runApp(MyApp(
      role: role ?? '',
      initialRoute: userJsonString != null ? 'home' : 'login',
    ));
  });
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final String role;

  const MyApp({
    super.key,
    required this.initialRoute,
    required this.role,
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
        home: initialRoute == 'login'
            ? const SplashScreen()
            : Home(
                isAdmin: role == 'admin',
              ),
      ),
    );
  }
}
