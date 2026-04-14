import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:tapatupa/user/pembayaran.dart';
import 'service/api_service.dart';

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
      // Mock data untuk testing/demo
      final mockData = [
        {
          'idPembayaran': 1,
          'nomorTransaksi': 'TRF-2024-045',
          'nilaiPembayaran': 1500000,
          'tanggalPembayaran': '08 April 2024',
          'statusPembayaran': 'Terima',
          'metodeAtau': 'Transfer Bank',
          'keterangan': 'Pembayaran SWF-2024-001',
        },
        {
          'idPembayaran': 2,
          'nomorTransaksi': 'TRF-2024-044',
          'nilaiPembayaran': 850000,
          'tanggalPembayaran': '05 April 2024',
          'statusPembayaran': 'Terima',
          'metodeAtau': 'Transfer Bank',
          'keterangan': 'Pembayaran SWF-2024-002',
        },
        {
          'idPembayaran': 3,
          'nomorTransaksi': 'TRF-2024-043',
          'nilaiPembayaran': 2200000,
          'tanggalPembayaran': '01 April 2024',
          'statusPembayaran': 'Terima',
          'metodeAtau': 'Transfer Bank',
          'keterangan': 'Pembayaran SWF-2024-003',
        },
        {
          'idPembayaran': 4,
          'nomorTransaksi': 'TRF-2024-042',
          'nilaiPembayaran': 1750000,
          'tanggalPembayaran': '28 Maret 2024',
          'statusPembayaran': 'Terima',
          'metodeAtau': 'Transfer Bank',
          'keterangan': 'Pembayaran SWF-2024-004',
        },
      ];
      
      if (mounted) {
        setState(() {
          _pembayaranData = mockData;
          _isLoading = false;
        });
      }
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
                body: jsonEncode(_activePayment),
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

              return Card(
                color: Colors.white,
                elevation: 2,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.green.withOpacity(0.2)),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  payment['nomorTransaksi'] ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  payment['keterangan'] ?? '-',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              payment['statusPembayaran'] ?? '-',
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      Divider(color: Colors.grey[200], height: 1),
                      SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Metode',
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[500],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                payment['metodeAtau'] ?? '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Tanggal',
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[500],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                payment['tanggalPembayaran'] ?? '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jumlah Pembayaran',
                              style: GoogleFonts.poppins(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              _formatRupiah(payment['nilaiPembayaran']),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
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
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: screenHeight * 0.15,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green[600]!, Colors.green[800]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.green[900]!.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                      child: Image.asset(
                        'assets/gorgabatak.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          child: Icon(Icons.payment, color: Colors.white, size: 28),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Riwayat Pembayaran',
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : _buildPaymentList(true),
      ),
    );
  }
}
