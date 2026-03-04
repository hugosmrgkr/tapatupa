import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:tapatupa/styles/app_styles.dart';
import 'package:tapatupa/screens/login.dart';

// ════════════════════════════════════════════════════════════
//  REGISTER SCREEN
//  lib/screens/registrasi.dart
// ════════════════════════════════════════════════════════════
class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final _nikController           = TextEditingController();
  final _emailController         = TextEditingController();
  final _usernameController      = TextEditingController();
  final _passwordController      = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading              = false;
  bool _obscurePassword        = true;
  bool _obscureConfirmPassword = true;
  int  _nikLength              = 0;

  @override
  void dispose() {
    _nikController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // ── Snackbar ─────────────────────────────────────────────
  void _showSnackbar(String title, String message, ContentType type) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 200,
          left: 10,
          right: 10),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
          title: title, message: message, contentType: type),
    ));
  }

  // ── Register ─────────────────────────────────────────────
  Future<void> _register() async {
    setState(() => _isLoading = true);

    final nik             = _nikController.text.trim();
    final email           = _emailController.text.trim();
    final username        = _usernameController.text.trim();
    final password        = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (nik.isEmpty || email.isEmpty || username.isEmpty ||
        password.isEmpty || confirmPassword.isEmpty) {
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
      _showSnackbar("Gagal", "Password tidak cocok", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      _showSnackbar("Gagal", "Email tidak valid", ContentType.failure);
      setState(() => _isLoading = false);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://tapatupa.taputkab.go.id/api/register-mobile'),
        headers: {
          'Content-Type': 'application/json',
          'Vendor-ID': '2kadMK7vwBQp9tDEd2OqvSxuPYimFQoK',
        },
        body: jsonEncode({
          'nik': nik,
          'email': email,
          'username': username,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      if (response.body.isEmpty) {
        _showSnackbar("Error", "Response server kosong", ContentType.failure);
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 200) {
        _showSnackbar("Berhasil", data['message'] ?? 'Registrasi berhasil',
            ContentType.success);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => login()));
      } else {
        _showSnackbar(
            "Gagal", data['message'] ?? 'Registrasi gagal', ContentType.failure);
      }
    } catch (e) {
      _showSnackbar("Error", e.toString(), ContentType.failure);
    } finally {
      setState(() => _isLoading = false);
    }
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
              // ── Header ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand kiri
                    Row(
                      children: [
                        Container(
                            width: 4,
                            height: 20,
                            decoration: RegisterStyles.sectionAccent),
                        const SizedBox(width: 8),
                        const Text('TAPATUPA',
                            style: RegisterStyles.headerBrand),
                      ],
                    ),
                    // Tombol kembali
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => login())),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.arrow_back_ios_new_rounded,
                                size: 12, color: AppColors.dark),
                            SizedBox(width: 4),
                            Text('Masuk',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.dark)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Logo ──────────────────────────────────────
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 20),
                  child: Image.asset('assets/logotapatupa.png',
                      width: 120, height: 120),
                ),
              ),

              // ── Judul ─────────────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buat Akun Baru', style: RegisterStyles.title),
                    SizedBox(height: 6),
                    Text('Lengkapi data diri anda untuk mendaftar',
                        style: RegisterStyles.subtitle),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Card: DATA IDENTITAS ──────────────────────
              _SectionCard(
                label: 'DATA IDENTITAS',
                children: [
                  // NIK
                  TextField(
                    controller: _nikController,
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    onChanged: (v) =>
                        setState(() => _nikLength = v.length),
                    style: const TextStyle(
                        fontSize: 14, color: AppColors.dark),
                    decoration: RegisterStyles.inputDecoration(
                      hint: 'NIK',
                      prefixIcon: Icons.badge_outlined,
                      counterText: '',
                    ).copyWith(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Text(
                          '$_nikLength/16',
                          style: RegisterStyles.counterText,
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                          minWidth: 0, minHeight: 0),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Sub hint NIK
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 4),
                    child: Text(
                      'Nomor Induk Kependudukan 16 digit',
                      style: TextStyle(
                          fontSize: 11, color: AppColors.gray),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontSize: 14, color: AppColors.dark),
                    decoration: RegisterStyles.inputDecoration(
                      hint: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ── Card: DATA AKUN ───────────────────────────
              _SectionCard(
                label: 'DATA AKUN',
                children: [
                  // Nama Lengkap / Username
                  TextField(
                    controller: _usernameController,
                    style: const TextStyle(
                        fontSize: 14, color: AppColors.dark),
                    decoration: RegisterStyles.inputDecoration(
                      hint: 'Nama Lengkap',
                      prefixIcon: Icons.person_outline_rounded,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Password
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(
                        fontSize: 14, color: AppColors.dark),
                    decoration: RegisterStyles.inputDecoration(
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

                  const SizedBox(height: 12),

                  // Konfirmasi Password
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    style: const TextStyle(
                        fontSize: 14, color: AppColors.dark),
                    decoration: RegisterStyles.inputDecoration(
                      hint: 'Konfirmasi Sandi',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.gray,
                          size: 20,
                        ),
                        onPressed: () => setState(() =>
                            _obscureConfirmPassword =
                                !_obscureConfirmPassword),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ── Tombol Daftar ─────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: RegisterStyles.daftarButton,
                    child: _isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2.5),
                          )
                        : const Text('Buat Akun',
                            style: RegisterStyles.buttonLabel),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Link Login ────────────────────────────────
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun? ',
                        style: RegisterStyles.loginPrompt),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => login())),
                      child: const Text('Login disini',
                          style: RegisterStyles.loginLink),
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

// ════════════════════════════════════════════════════════════
//  Widget: Section Card (DATA IDENTITAS / DATA AKUN)
// ════════════════════════════════════════════════════════════
class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: RegisterStyles.sectionCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label section dengan garis merah kiri
            Row(
              children: [
                Container(
                  width: 3,
                  height: 16,
                  decoration: RegisterStyles.sectionAccent,
                ),
                const SizedBox(width: 8),
                Text(label, style: RegisterStyles.sectionLabel),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}