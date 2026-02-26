import 'dart:async';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  // ── Warna utama ──────────────────────────────────────────
  static const Color kRed = Color(0xFFEC4336);
  static const Color kRedLight = Color(0xFFFFF0EF);
  static const Color kGray = Color(0xFF8A8A9A);
  static const Color kDark = Color(0xFF1A1A2E);

  // ── Data slide ───────────────────────────────────────────
final List<Map<String, String>> slides = const [
    {
      "img": "assets/aib1.jpeg",
      "step": "LANGKAH 01",
      "title": "Kelola Aset Daerah Tanpa Batas",
      "desc":
          "Urus sewa lahan dan bangunan milik Pemkab Tapanuli Utara kapan saja, tanpa perlu hadir langsung ke kantor BKAD.",
    },
    {
      "img": "assets/aib2.jpeg",
      "step": "LANGKAH 02",
      "title": "Data Aman, Transparan & Akuntabel",
      "desc":
          "Dokumen kontrak tersimpan digital dan terenkripsi. Pantau status permohonan serta tarif resmi secara real-time.",
    },
    {
      "img": "assets/aib3.jpeg",
      "step": "LANGKAH 03",
      "title": "Optimalkan Pendapatan Asli Daerah",
      "desc":
          "Sistem validasi aset digital mencegah kebocoran PAD dan memastikan pemanfaatan aset sesuai perjanjian resmi.",
    },
  ];
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;
      final next = (_currentIndex + 1) % slides.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onButtonTap() {
    _timer?.cancel();
    if (_currentIndex < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  String get _buttonLabel {
    if (_currentIndex == 0) return 'Mulai Sekarang';
    if (_currentIndex == slides.length - 1) return 'Masuk Sekarang';
    return 'Lanjutkan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar tipis di atas
            _ProgressBar(current: _currentIndex, total: slides.length),

            // Area PageView
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (_, i) => _SlideItem(slide: slides[i]),
              ),
            ),

            // Dot indicator
            _DotIndicator(current: _currentIndex, total: slides.length),

            const SizedBox(height: 32),

            // Tombol utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: _PrimaryButton(
                label: _buttonLabel,
                onTap: _onButtonTap,
              ),
            ),

            // Skip
            if (_currentIndex < slides.length - 1)
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text(
                  'Lewati',
                  style: TextStyle(
                    color: kGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            else
              const SizedBox(height: 48),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Widget: Progress Bar
// ════════════════════════════════════════════════════════════
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.current, required this.total});
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Stack(
        children: [
          Container(height: 3, color: const Color(0xFFEEEEEE)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut,
            height: 3,
            width: constraints.maxWidth * ((current + 1) / total),
            decoration: BoxDecoration(
              color: _OnboardingScreenState.kRed,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      );
    });
  }
}

// ════════════════════════════════════════════════════════════
//  Widget: Slide Item
// ════════════════════════════════════════════════════════════
class _SlideItem extends StatelessWidget {
  const _SlideItem({required this.slide});
  final Map<String, String> slide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ilustrasi dengan card bulat + shadow merah lembut
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: _OnboardingScreenState.kRedLight,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: _OnboardingScreenState.kRed.withOpacity(0.12),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  slide['img']!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Label langkah
          Text(
            slide['step']!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
              color: _OnboardingScreenState.kRed,
            ),
          ),

          const SizedBox(height: 12),

          // Judul
          Text(
            slide['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: _OnboardingScreenState.kDark,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 14),

          // Deskripsi
          Text(
            slide['desc']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: _OnboardingScreenState.kGray,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Widget: Dot Indicator
// ════════════════════════════════════════════════════════════
class _DotIndicator extends StatelessWidget {
  const _DotIndicator({required this.current, required this.total});
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 7,
          width: isActive ? 24 : 7,
          decoration: BoxDecoration(
            color: isActive
                ? _OnboardingScreenState.kRed
                : const Color(0xFFE0E0E8),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Widget: Primary Button
// ════════════════════════════════════════════════════════════
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: _OnboardingScreenState.kRed,
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: _OnboardingScreenState.kRed.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text(
            label,
            key: ValueKey(label),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}