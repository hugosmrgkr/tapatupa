import 'package:flutter/material.dart';
import 'package:tapatupa/user/loading_screen.dart';
import 'package:tapatupa/user/login.dart';
import 'package:tapatupa/user/RetributionListPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user/home.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Clear any existing login data on app start
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // This ensures fresh login is required
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/login': (context) => login(),
        '/home': (context) => home(),
        '/retribution': (context) => RetributionListPage(),
      },
      home: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 2), // Show loading screen for 2 seconds
          () => SharedPreferences.getInstance(),
        ),
        builder: (context, snapshot) {
          // Always show LoadingScreen first
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }

          return login();
        },
      ),
    );
  }
}
