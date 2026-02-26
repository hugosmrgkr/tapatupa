import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:tapatupa/user/pembayaran.dart';
import 'package:tapatupa/user/service/api_service.dart';

class pembayaran_tagihan extends StatefulWidget {
  @override
  _PembayaranTagihanState createState() => _PembayaranTagihanState();
}

class _PembayaranTagihanState extends State<pembayaran_tagihan> {
  List<dynamic>? _pembayaranData;
  Map<String, dynamic>? _activePayment;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
    _loadActivePayment();
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final idPersonal = prefs.getInt('idPersonal');

      if (idPersonal == null) {
        throw Exception('User data not found');
      }

      final response = await ApiService.get('pembayaran-mobile/$idPersonal');

      setState(() {
        _pembayaranData = response['pembayaranSewa'] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });

      if (e.toString().contains('Unauthorized')) {
        await ApiService.logout();
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    }
  }

  Future<void> _loadActivePayment() async {
    try {
      final response = await ApiService.get('tagihan-mobile/active-payment');
      if (response['status'] == 200) {
        setState(() {
          _activePayment = response['data'];
        });
      }
    } catch (e) {
      print('Error loading active payment: $e');
    }
  }

  String _formatRupiah(num? value) {
    if (value == null) return 'Rp 0';
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  Widget _buildActivePaymentCard() {
    if (_activePayment == null) return SizedBox.shrink();

    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red.shade200),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PembayaranPage(
                responseBody: jsonEncode(_activePayment),
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pembayaran Aktif',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Menunggu Pembayaran',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  Text(
                    _formatRupiah(_activePayment!['totalTagihan'] as num?),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No. Tagihan',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  Text(
                    _activePayment!['nomorTagihan'] ?? 'N/A',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bayar Dalam',
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  Text(
                    '24 jam',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentList(bool isPaid) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isPaid) _buildActivePaymentCard(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: _pembayaranData?.length ?? 0,
            itemBuilder: (context, index) {
              final payment = _pembayaranData![index];
              final bool isPaymentPaid =
                  payment['namaStatus'] == 'Sudah Dibayar';
              if (isPaid != isPaymentPaid) return SizedBox.shrink();

              return Card(
                color: Colors.white,
                elevation: 2,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              payment['noInvoice'] ?? '-',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isPaid ? Colors.green : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              payment['namaStatus'] ?? '-',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Retribusi    : ${payment['objekRetribusi']}',
                        style: GoogleFonts.roboto(),
                      ),
                      Text(
                        'Nama         : ${payment['namaWajibRetribusi']}',
                        style: GoogleFonts.roboto(),
                      ),
                      if (payment['alamatLengkap'] != null)
                        Text(
                          'Alamat       : ${payment['alamatLengkap']}',
                          style: GoogleFonts.roboto(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Bayar:',
                                style: GoogleFonts.roboto(
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                _formatRupiah(payment['totalBayar']),
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700],
                                ),
                              ),
                            ],
                          ),
                          if (payment['tanggalPembayaran'] != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Tanggal Bayar:',
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  payment['tanggalPembayaran']
                                      .toString()
                                      .split(' ')[0],
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Container(
                  height:
                      screenHeight / 16 + MediaQuery.of(context).padding.top,
                  width: double.infinity,
                  color: Colors.white,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      'assets/gorgabatak.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight /
                    20, // Menyesuaikan posisi ke tengah lebih baik
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Riwayat Pembayaran',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Column(
              //     children: [
              //       SizedBox(height: 10),
              //     ],
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _errorMessage != null
                    ? Center(child: Text(_errorMessage!))
                    : _buildPaymentList(true), // true for paid payments only
          ),
        ],
      ),
    );
  }
}
