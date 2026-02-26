import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _showSnackbar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 200),
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

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final nik = _nikController.text.trim();
    final email = _emailController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (nik.isEmpty ||
        email.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showSnackbar("Gagal", "Semua field harus diisi", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }

    if (nik.length != 16) {
      _showSnackbar("Gagal", "NIK harus 16 digit", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar(
          "Gagal", "Password dan konfirmasi tidak cocok", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }

    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      _showSnackbar("Gagal", "Email tidak valid", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }

    const url = 'https://tapatupa.taputkab.go.id/api/register-mobile';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Vendor-ID': '2kadMK7vwBQp9tDEd2OqvSxuPYimFQoK',
        },
        body: jsonEncode({
          'nik': nik,
          'email': email,
          'username': username,
          'password': password,
          'password_confirmation': confirmPassword, // ✅ diperbaiki
        }),
      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.body.isEmpty) {
        _showSnackbar(
            "Error", "Response dari server kosong", ContentType.failure);
        return;
      }

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 200) {
        final message = responseData['message'] ?? 'Registrasi berhasil';
        _showSnackbar("Berhasil", message, ContentType.success);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login()));
      } else {
        final errorMessage = responseData['message'] ?? 'Registrasi gagal';
        _showSnackbar("Gagal", errorMessage, ContentType.failure);
      }
    } catch (e) {
      _showSnackbar(
          "Error", "Terjadi kesalahan: ${e.toString()}", ContentType.failure);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nikController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Image.asset('assets/logotapatupa.png', width: 200, height: 200),
            SizedBox(height: 20),
            TextField(
              controller: _nikController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: InputDecoration(
                  labelText: 'NIK (16 digit)', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Username', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Daftar',
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
                  'Sudah punya akun? ',
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  ),
                  child: Text('Login disini',
                      style:
                          GoogleFonts.roboto(color: Colors.red, fontSize: 15)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
