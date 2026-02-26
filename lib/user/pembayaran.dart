import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tapatupa/user/home.dart';
import 'service/api_service.dart';

class PembayaranPage extends StatefulWidget {
  final String responseBody;

  const PembayaranPage({required this.responseBody, Key? key})
      : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  late DateTime _waktuSekarang;
  late DateTime _waktuJatuhTempo;
  late String _formattedWaktuJatuhTempo;
  late String _formattedTotalBayar;
  late String _noVirtualAccount;
  late Timer _timer;
  late int _totalBayar;
  late String _formattedSisaWaktu;
  late String _nomorTagihan;
  late DateTime _tanggalJatuhTempo;
  late String _formattedTanggalJatuhTempo;
  late int _jumlahTagihan;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _startPaymentStatusCheck();
  }

  // void _initializeData() {
  //   try {
  //     final data = jsonDecode(widget.responseBody);

  //     // Initialize payment data from response
  //     final virtualAccountData = data['virtualAccountData'] ?? {};
  //     final billDetails =
  //         ((virtualAccountData['billDetails'] as List?)?.firstOrNull) ?? {};
  //     final billAmount = billDetails['billAmount'] ?? {};

  //     setState(() {
  //       _totalBayar =
  //           _parseInt(billAmount['value']?.replaceAll('.00', '') ?? '0');
  //       _noVirtualAccount =
  //           virtualAccountData['noVirtualAccount']?.toString() ?? 'N/A';
  //       _nomorTagihan = virtualAccountData['trxId']?.toString() ?? 'N/A';
  //       // Initialize other state variables...

  //       _waktuSekarang = DateTime.now();
  //       _waktuJatuhTempo = _waktuSekarang.add(const Duration(days: 7));
  //       _formattedWaktuJatuhTempo =
  //           DateFormat('dd MMM yyyy, HH:mm').format(_waktuJatuhTempo);
  //       _formattedSisaWaktu =
  //           _formatDuration(_waktuJatuhTempo.difference(_waktuSekarang));
  //       _totalBayar =
  //           _parseInt(billAmount['value']?.replaceAll('.00', '') ?? '0');
  //       _noVirtualAccount =
  //           virtualAccountData['noVirtualAccount']?.toString() ?? 'N/A';
  //       _nomorTagihan = virtualAccountData['trxId']?.toString() ?? 'N/A';
  //       _jumlahTagihan =
  //           _totalBayar; // Using the same value as total bayar since it's the same in the response

  //       _tanggalJatuhTempo = _parseDate(virtualAccountData['expiredDate']) ??
  //           _waktuSekarang.add(const Duration(days: 1));
  //       _formattedTanggalJatuhTempo =
  //           DateFormat('dd MMM yyyy').format(_tanggalJatuhTempo);
  //       _formattedTotalBayar = NumberFormat.currency(
  //         locale: 'id',
  //         symbol: 'Rp ',
  //         decimalDigits: 0,
  //       ).format(_totalBayar);
  //       _isLoading = false;
  //     });

  //     _startCountdown();
  //   } catch (e) {
  //     setState(() {
  //       _errorMessage = 'Failed to process payment data: ${e.toString()}';
  //       _isLoading = false;
  //     });
  //   }
  // }

  void _initializeData() {
    try {
      final data = jsonDecode(widget.responseBody);
      print('Response data: $data');

      // Get the first tagihan detail since it contains VA number
      final tagihanDetail = (data['tagihanDetail'] as List?)?.firstOrNull ?? {};
      print('Tagihan Detail: $tagihanDetail'); // Debug log

      setState(() {
        // Get VA number from tagihanDetail
        _noVirtualAccount =
            tagihanDetail['noVirtualAccount']?.toString() ?? 'N/A';
        _nomorTagihan = tagihanDetail['trxId']?.toString() ?? 'N/A';
        _totalBayar = tagihanDetail['totalTagihan'] as int? ?? 0;
        _jumlahTagihan = tagihanDetail['jumlahTagihan'] as int? ?? 0;

        _waktuSekarang = DateTime.now();
        _waktuJatuhTempo = _waktuSekarang.add(const Duration(hours: 24));

        _tanggalJatuhTempo = _parseDate(tagihanDetail['tanggalJatuhTempo']) ??
            _waktuSekarang.add(const Duration(days: 1));

        // Format dates and currency
        _formattedWaktuJatuhTempo =
            DateFormat('dd MMM yyyy, HH:mm').format(_waktuJatuhTempo);
        _formattedTanggalJatuhTempo =
            DateFormat('dd MMM yyyy').format(_tanggalJatuhTempo);
        _formattedTotalBayar = NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp ',
          decimalDigits: 0,
        ).format(_totalBayar);

        _formattedSisaWaktu =
            _formatDuration(_waktuJatuhTempo.difference(_waktuSekarang));
        _isLoading = false;
      });

      print('Initialized VA number: $_noVirtualAccount'); // Debug log
      _startCountdown();
    } catch (e) {
      print('Error in _initializeData: $e');
      setState(() {
        _errorMessage = 'Gagal memproses data pembayaran: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<void> _checkPaymentStatus() async {
    try {
      final response = await ApiService.get('payment-status/$_nomorTagihan');

      if (response['status'] == 'PAID') {
        _timer.cancel(); // Stop polling
        // Handle successful payment
        // You might want to show a success dialog or navigate to a success page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    } catch (e) {
      print('Error checking payment status: $e');
    }
  }

  void _startPaymentStatusCheck() {
    // Check payment status every 30 seconds
    Timer.periodic(Duration(seconds: 30), (timer) {
      _checkPaymentStatus();
    });
  }

  // Method to cancel payment
  Future<void> _cancelPayment() async {
    try {
      final response = await ApiService.post(
        'cancel-payment',
        {'trxId': _nomorTagihan},
      );

      if (response['status'] == 'SUCCESS') {
        Navigator.pop(context);
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel payment: ${e.toString()}')),
      );
    }
  }

  int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  DateTime? _parseDate(dynamic dateString) {
    try {
      if (dateString == null) return null;
      return DateTime.parse(dateString.toString());
    } catch (e) {
      debugPrint('Date Parse Error: $e');
      return null;
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      setState(() {
        final remainingTime = _waktuJatuhTempo.difference(DateTime.now());
        _formattedSisaWaktu = remainingTime.isNegative
            ? 'Waktu telah habis'
            : _formatDuration(remainingTime);
      });
    });
  }

  String _formatDuration(Duration duration) {
    final days = duration.inDays.toString().padLeft(2, '0');
    final hours = (duration.inHours % 24).toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours jam $minutes menit $seconds detik';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingScreen();
    }

    if (_errorMessage != null) {
      return _buildErrorScreen();
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPaymentCard(),
              const SizedBox(height: 16),
              _buildVirtualAccountCard(),
              const SizedBox(height: 16),
              _buildInstructionsCard(),
              const SizedBox(height: 16),
              _buildDetailsCard(),
              const SizedBox(height: 16),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Error',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 179, 13, 1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 50, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                _errorMessage!,
                style: GoogleFonts.roboto(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Kembali',
                  style: GoogleFonts.roboto(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Pembayaran',
        style: GoogleFonts.roboto(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 179, 13, 1),
      elevation: 0,
    );
  }

  Widget _buildPaymentCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentRow('Total Pembayaran', _formattedTotalBayar),
            const Divider(height: 24),
            _buildPaymentRow('Bayar Dalam', _formattedSisaWaktu,
                isUrgent: true),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isUrgent = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(fontSize: 15),
        ),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isUrgent ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildVirtualAccountCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/img.png', width: 40, height: 40),
                const SizedBox(width: 8),
                Text(
                  'TAPATUPA',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'No. Virtual Account',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _noVirtualAccount,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 250, 75, 40),
                  ),
                ),
                GestureDetector(
                  onTap: _copyVirtualAccount,
                  child: Text(
                    'Salin',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 0, 83, 151),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Text(
              'Silakan menunggu proses verifikasi oleh petugas.',
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Penting: Transfer ke nomor Virtual Account di atas.',
              style: GoogleFonts.roboto(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void _copyVirtualAccount() {
    Clipboard.setData(ClipboardData(text: _noVirtualAccount));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nomor VA disalin!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildInstructionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Petunjuk Transfer Virtual Account',
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInstructionStep('1. Pilih *Transfer* > *Virtual Account*.'),
            _buildInstructionStep(
                '2. Pilih *Rekening Debit* > Masukkan nomor Virtual Account **$_noVirtualAccount**.'),
            _buildInstructionStep(
                '3. Tagihan yang harus dibayar akan muncul pada layar konfirmasi.'),
            _buildInstructionStep(
                '4. Periksa informasi yang tertera di layar. Pastikan nama penerima adalah **TAPATUPA**.'),
            const SizedBox(height: 16),
            Text(
              'Catatan: Transfer hanya dapat dilakukan via Bank SUMUT.',
              style: GoogleFonts.roboto(
                fontSize: 13,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 13),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Detail Pembayaran',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailRow('No. Tagihan', _nomorTagihan),
            _buildDetailRow(
                'Jumlah Tagihan',
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(_jumlahTagihan)),
            // _buildDetailRow('Jatuh Tempo', _formattedTanggalJatuhTempo),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.roboto(fontSize: 14)),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => home(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Oke',
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
