import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'dart:async';

import 'package:tapatupa/styles/app_styles.dart';
import 'package:tapatupa/user/admin/admin_home.dart';
import 'package:tapatupa/user/home.dart';
import 'package:tapatupa/user/service/api_service.dart';

// ════════════════════════════════════════════════════════════
//  LOGIN SCREEN
//  lib/screens/login.dart
// ════════════════════════════════════════════════════════════
class login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  Timer? _sessionTimer;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  // ── Snackbar ─────────────────────────────────────────────
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

  // ── Cek session ──────────────────────────────────────────
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
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('tokenType', tokenType);
    await prefs.setInt('expiresIn', expiresIn);
    await prefs.setBool('isLoggedIn', true);

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
      // ✅ FIX: endSession kembali ke login, bukan register
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  // ── Login ────────────────────────────────────────────────
  Future<void> _login() async {
    setState(() => _isLoading = true);

    try {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (username.isEmpty || password.isEmpty) {
        _showSnackbar(
            "Gagal", "Username dan Password harus diisi", ContentType.failure);
        return;
      }

      // Admin login
      if (username == "petugas" && password == "petugas1234") {
        _showSnackbar(
            "Berhasil", "Login sebagai admin berhasil", ContentType.success);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setBool('isAdmin', true);
        await prefs.setString('accessToken', 'admin_token');
        await prefs.setString('namaLengkap', 'Admin Petugas');
        await prefs.setInt('roleId', 1);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
        return;
      }

      // User biasa
      final response = await ApiService.login(username, password);
      if (response['responseCode'] == 200) {
        _showSnackbar("Berhasil", "Login berhasil", ContentType.success);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), ContentType.failure);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ════════════════════════════════════════════════════════
  //  BUILD
  // ════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header brand ─────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('TAPATUPA', style: LoginStyles.headerBrand),
                  ],
                ),
              ),

              // ── Logo ──────────────────────────────────────
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: Image.asset(
                    'assets/logotapatupa.png',
                    width: 140,
                    height: 140,
                  ),
                ),
              ),

              // ── Judul & subjudul ──────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat Datang', style: LoginStyles.title),
                    SizedBox(height: 6),
                    Text(
                      'Masuk untuk melanjutkan ke akun anda',
                      style: LoginStyles.subtitle,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Form card ─────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: LoginStyles.formCard,
                  child: Column(
                    children: [
                      // Username
                      TextField(
                        controller: _usernameController,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.dark),
                        decoration: LoginStyles.inputDecoration(
                          hint: 'Nama Lengkap',
                          prefixIcon: Icons.person_outline_rounded,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Password
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.dark),
                        decoration: LoginStyles.inputDecoration(
                          hint: 'Kata sandi',
                          prefixIcon: Icons.lock_outline_rounded,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.gray,
                              size: 20,
                            ),
                            onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Tombol Masuk
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: LoginStyles.masukButton,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text('Masuk',
                                  style: LoginStyles.buttonLabel),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Divider "atau" ────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                            color: AppColors.divider, thickness: 1)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('atau', style: LoginStyles.orDivider),
                    ),
                    Expanded(
                        child: Divider(
                            color: AppColors.divider, thickness: 1)),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Link Daftar ───────────────────────────────
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum punya akun? ',
                        style: LoginStyles.registerPrompt),
                    GestureDetector(
                      // ✅ FIX: pakai pushNamed ke route /register
                      onTap: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: const Text('Daftar disini',
                          style: LoginStyles.registerLink),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}