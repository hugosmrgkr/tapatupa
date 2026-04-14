import 'package:flutter/material.dart';
import 'package:tapatupa/screens/role_select_login.dart';
import 'package:tapatupa/screens/registrasi.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/main_navigation.dart';

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
        '/roleSelect':  (context) => RoleSelectLogin(),
        '/register':    (context) => Register(), 
        '/home':        (context) => MainNavigation(),
      },

      home: RoleSelectLogin(),
    );
  }
}