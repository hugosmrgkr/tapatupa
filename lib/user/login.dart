import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/user/admin/admin_home.dart';
import 'home.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'dart:async';
import 'service/api_service.dart';

import 'registrasi.dart';

class login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  Timer? _sessionTimer;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  void _showSnackbar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 270,
        left: 10,
        right: 10,
      ),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    String? accessToken = prefs.getString('accessToken');

    if (isLoggedIn == true && accessToken != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    }
  }

  Future<void> _startSession(Map<String, dynamic> userData, String accessToken,
      String tokenType, int expiresIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('namaLengkap', userData['namalengkap'] ?? '');
    await prefs.setString('fotoUser', userData['fotouser'] ?? '');
    await prefs.setInt('id', userData['id'] ?? 0);
    await prefs.setInt('roleId', userData['roletd'] ?? 0);
    await prefs.setString('roleName', userData['roleName'] ?? '');
    await prefs.setInt('idPersonal', userData['idPersonal'] ?? 0);

    // Make sure token is stored in the correct format
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('tokenType', tokenType);
    await prefs.setInt('expiresIn', expiresIn);
    await prefs.setBool('isLoggedIn', true);

    // Set timer untuk session
    _sessionTimer = Timer(Duration(seconds: expiresIn), () async {
      await _endSession();
    });
  }

  Future<void> _endSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      _showSnackbar(
          "Sesi Berakhir", "Sesi Anda telah habis.", ContentType.warning);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  // Future<void> _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     // final email = _emailController.text.trim();
  //     final username = _usernameController.text.trim();
  //     final password = _passwordController.text.trim();

  //     if (username.isEmpty || password.isEmpty) {
  //       _showSnackbar(
  //           "Gagal", "Username dan Password harus diisi", ContentType.failure);
  //       return;
  //     }

  //     final response = await ApiService.login(username, password);

  //     if (response['responseCode'] == 200) {
  //       _showSnackbar("Berhasil", "Login berhasil", ContentType.success);

  //       // Navigate to home page
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => home()),
  //       );
  //     }
  //   } catch (e) {
  //     _showSnackbar("Error", e.toString(), ContentType.failure);
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (username.isEmpty || password.isEmpty) {
        _showSnackbar(
            "Gagal", "Username dan Password harus diisi", ContentType.failure);
        return;
      }

      // Check for admin credentials
      if (username == "petugas" && password == "petugas1234") {
        _showSnackbar(
            "Berhasil", "Login sebagai admin berhasil", ContentType.success);

        // Save admin session
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setBool('isAdmin', true); // Add admin flag
        await prefs.setString('accessToken', 'admin_token');
        await prefs.setString('namaLengkap', 'Admin Petugas');
        await prefs.setInt('roleId', 1); // Set role ID for admin

        // Navigate to admin home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AdminHome()), // Make sure to import admin_home.dart
        );
        return;
      }

      // Regular user login flow
      final response = await ApiService.login(username, password);

      if (response['responseCode'] == 200) {
        _showSnackbar("Berhasil", "Login berhasil", ContentType.success);

        // Navigate to regular user home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), ContentType.failure);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    // _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logotapatupa.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                // TextField(
                //   controller: _emailController,
                //   decoration: InputDecoration(
                //     labelText: 'Email',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(height: 16),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.redAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Login',
                              style: GoogleFonts.roboto(
                                  color: Colors.white, fontSize: 16),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun? ',
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text(
                        'Daftar disini',
                        style:
                            GoogleFonts.roboto(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
