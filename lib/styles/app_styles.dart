import 'package:flutter/material.dart';

// ── Warna ────────────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const Color primary     = Color(0xFFEC4336);
  static const Color primaryBg   = Color(0xFFFFF0EF);
  static const Color dark        = Color(0xFF1A1A2E);
  static const Color gray        = Color(0xFF8A8A9A);
  static const Color divider     = Color(0xFFEEEEEE);
  static const Color dotInactive = Color(0xFFE0E0E8);
  static const Color inputBg     = Color(0xFFF7F8FA);
  static const Color scaffold    = Color(0xFFF2F4F7);
  static const Color white       = Colors.white;
}

// ════════════════════════════════════════════════════════════
//  ONBOARDING STYLES
// ════════════════════════════════════════════════════════════
class OnboardingStyles {
  OnboardingStyles._();

  static const TextStyle slideTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    height: 1.3,
  );

  static const TextStyle slideDesc = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
    height: 1.7,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.white,
  );

  static const TextStyle skipText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );

  static BoxDecoration illustrationCard = BoxDecoration(
    color: AppColors.primaryBg,
    borderRadius: BorderRadius.circular(40),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.12),
        blurRadius: 32,
        offset: const Offset(0, 16),
      ),
    ],
  );

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 8,
    shadowColor: AppColors.primary.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}

// ════════════════════════════════════════════════════════════
//  LOGIN STYLES
// ════════════════════════════════════════════════════════════
class LoginStyles {
  LoginStyles._();

  static const TextStyle headerBrand = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    letterSpacing: 1.2,
  );

  static const TextStyle title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    height: 1.2,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
    height: 1.5,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle orDivider = TextStyle(
    fontSize: 13,
    color: AppColors.gray,
  );

  static const TextStyle registerPrompt = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
  );

  static const TextStyle registerLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static BoxDecoration formCard = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.07),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static InputDecoration inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: AppColors.gray),
      prefixIcon: Icon(prefixIcon, color: AppColors.gray, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.inputBg,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  static ButtonStyle masukButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 6,
    shadowColor: AppColors.primary.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

// ════════════════════════════════════════════════════════════
//  REGISTER STYLES
// ════════════════════════════════════════════════════════════
class RegisterStyles {
  RegisterStyles._();

  // ── Text Styles ────────────────────────────────────────────

  static const TextStyle headerBrand = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    letterSpacing: 1.2,
  );

  static const TextStyle title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    height: 1.2,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
    height: 1.5,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    letterSpacing: 1.5,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle loginPrompt = TextStyle(
    fontSize: 14,
    color: AppColors.gray,
  );

  static const TextStyle loginLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const TextStyle counterText = TextStyle(
    fontSize: 12,
    color: AppColors.gray,
  );

  // ── Decorations ───────────────────────────────────────────

  /// Card tiap section (DATA IDENTITAS / DATA AKUN)
  static BoxDecoration sectionCard = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 20,
        offset: const Offset(0, 6),
      ),
    ],
  );

  /// Garis merah kiri pada judul section
  static BoxDecoration sectionAccent = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(2),
  );

  // ── Input Decoration ──────────────────────────────────────

  static InputDecoration inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
    String? counterText,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: AppColors.gray),
      prefixIcon: Icon(prefixIcon, color: AppColors.gray, size: 20),
      suffixIcon: suffixIcon,
      counterText: counterText,
      filled: true,
      fillColor: AppColors.inputBg,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  // ── Button Style ──────────────────────────────────────────

  static ButtonStyle daftarButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 6,
    shadowColor: AppColors.primary.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}