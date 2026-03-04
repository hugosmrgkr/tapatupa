import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tapatupa/styles/app_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  // ── Data slide ───────────────────────────────────────────
  final List<Map<String, String>> slides = const [
    {
      "img": "assets/aib1.jpeg",
      "title": "Selamat Datang di TAPATUPA",
      "desc":
          "Solusi digital terpadu untuk pengelolaan dan penyewaan aset daerah di Kabupaten Tapanuli Utara secara transparan dan akuntabel.",
    },
    {
      "img": "assets/aib2.jpeg",
      "title": "Katalog Aset yang Lengkap",
      "desc":
          "Telusuri berbagai pilihan lahan dan bangunan milik daerah dengan informasi lokasi serta status ketersediaan yang diperbarui secara real-time.",
    },
    {
      "img": "assets/aib3.jpeg",
      "title": "Pengajuan Sewa Jadi Praktis",
      "desc":
          "Urus permohonan sewa aset tanpa perlu ke kantor. Cukup unggah dokumen persyaratan dan pantau proses verifikasi langsung dari genggaman Anda.",
    },
    {
      "img": "assets/aib4.jpeg",
      "title": "Transparansi Pembayaran",
      "desc":
          "Lakukan pembayaran retribusi dengan aman dan dapatkan konfirmasi instan. Semua riwayat transaksi tercatat rapi dalam sistem yang terintegrasi.",
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

  String get _buttonLabel =>
      _currentIndex == slides.length - 1 ? 'Mulai' : 'Selanjutnya';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            _ProgressBar(current: _currentIndex, total: slides.length),

            // PageView
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

            // Tombol lewati
            if (_currentIndex < slides.length - 1)
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text(
                  'Lewati',
                  style: OnboardingStyles.skipText,
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
          Container(height: 3, color: AppColors.divider),
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut,
            height: 3,
            width: constraints.maxWidth * ((current + 1) / total),
            decoration: BoxDecoration(
              color: AppColors.primary,
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
          // Card ilustrasi
          Container(
            width: 240,
            height: 240,
            decoration: OnboardingStyles.illustrationCard,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  slide['img']!,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Text(
            slide['title']!,
            textAlign: TextAlign.center,
            style: OnboardingStyles.slideTitle,
          ),

          const SizedBox(height: 14),

          Text(
            slide['desc']!,
            textAlign: TextAlign.center,
            style: OnboardingStyles.slideDesc,
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
            color: isActive ? AppColors.primary : AppColors.dotInactive,
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
        style: OnboardingStyles.primaryButton,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text(
            label,
            key: ValueKey(label),
            style: OnboardingStyles.buttonLabel,
          ),
        ),
      ),
    );
  }
}