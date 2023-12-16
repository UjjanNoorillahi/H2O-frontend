import 'package:flutter/cupertino.dart';
import 'package:h2o/provider/auth_token_provider.dart';
import 'package:h2o/screens/friends_screen/friends_suggestion_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthTokenProvider()),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FriendsSuggestionPage(),
      ),
    );
  }
}
