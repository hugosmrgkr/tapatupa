import 'package:flutter/material.dart';
import 'package:tapatupa/user/loading_screen.dart';
import 'package:tapatupa/user/login.dart';
import 'package:tapatupa/user/RetributionListPage.dart';
import 'package:tapatupa/user/onboarding_screen.dart'; // TAMBAHAN
import 'package:shared_preferences/shared_preferences.dart';
import 'user/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // reset login tiap run

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/loading': (context) => LoadingScreen(),
        '/onboarding': (context) => OnboardingScreen(), // TAMBAHAN
        '/login': (context) => login(),
        '/home': (context) => home(),
        '/retribution': (context) => RetributionListPage(),
      },

      home: FutureBuilder<SharedPreferences>(
        future: Future.delayed(
          const Duration(seconds: 3),
          () => SharedPreferences.getInstance(),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingScreen();
          }

         
          return OnboardingScreen();
        },
      ),
    );
  }
}