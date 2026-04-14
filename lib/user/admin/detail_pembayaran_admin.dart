import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPembayaranAdmin extends StatelessWidget {
  final Map<String, dynamic> pembayaran;

  const DetailPembayaranAdmin({Key? key, required this.pembayaran})
      : super(key: key);

  String _formatRupiah(num value) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.10,
            pinned: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Detail Pembayaran',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Card
                    Card(
                      elevation: 2,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pembayaran['noInvoice'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      pembayaran['wajibRetribusi'] ?? '-',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: pembayaran['statusColor'] ??
                                        Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    pembayaran['status'] ?? 'Lunas',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Detail Pembayaran
                    Text(
                      'Informasi Pembayaran',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow(
                              'Nomor Transaksi',
                              'TRX-${pembayaran['noInvoice']}-001',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Nama Pembayar',
                              pembayaran['wajibRetribusi'],
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Pembayaran',
                              pembayaran['tanggalBayar'] ?? '20 April 2026',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Waktu Pembayaran',
                              '14:35:22 WIB',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Metode Pembayaran',
                              pembayaran['metode'] ?? 'Virtual Account',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Detail Nominal
                    Text(
                      'Detail Nominal',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPriceRow(
                              'Nomor Tagihan',
                              0,
                              customValue: pembayaran['noInvoice'],
                            ),
                            SizedBox(height: 12),
                            _buildPriceRow(
                              'Nominal Yang Dibayarkan',
                              pembayaran['totalBayar'],
                              isBold: true,
                              color: Colors.green,
                            ),
                            SizedBox(height: 12),
                            _buildPriceRow(
                              'Biaya Admin (jika ada)',
                              0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Referensi Bank
                    Text(
                      'Referensi Transaksi',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (pembayaran['metode'] == 'Virtual Account' ||
                                pembayaran['metode'] == null) ...[
                              _buildInfoRow(
                                'Nomor Virtual Account',
                                pembayaran['nomorVa'] ?? '12345 6789012 3456 7',
                              ),
                              Divider(height: 16),
                            ],
                            _buildInfoRow(
                              'Referensi Bank',
                              pembayaran['refBank'] ?? '123456789ABC',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Bank Penerima',
                              pembayaran['bank'] ?? 'BCA',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Bukti Pembayaran
                    Text(
                      'Bukti Pembayaran',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            ListTile(
                              leading:
                                  Icon(Icons.picture_as_pdf, color: Colors.red),
                              title: Text(
                                'Bukti Pembayaran Digital',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'Format: PDF',
                                style: GoogleFonts.poppins(fontSize: 11),
                              ),
                              trailing: Icon(Icons.download),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Mendownload bukti pembayaran...'),
                                  ),
                                );
                              },
                            ),
                            Divider(height: 1),
                            ListTile(
                              leading: Icon(Icons.receipt,
                                  color: Color(0xFFDC3545)),
                              title: Text(
                                'Kwitansi Pembayaran',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'Format: PDF',
                                style: GoogleFonts.poppins(fontSize: 11),
                              ),
                              trailing: Icon(Icons.download),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Mendownload kwitansi...'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Status
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[300]!),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'PEMBAYARAN SUKSES',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pembayaran telah berhasil diterima dan diverifikasi oleh sistem. Tagihan telah ditandai LUNAS.',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bukti pembayaran sedang didownload...'),
                            ),
                          );
                        },
                        icon: Icon(Icons.download),
                        label: Text('Download Bukti (PDF)'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDC3545),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                        label: Text('Kembali'),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Text(
            value ?? '-',
            textAlign: TextAlign.end,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(
    String label,
    num value, {
    bool isBold = false,
    Color color = const Color(0xFF333333),
    String? customValue,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: color,
          ),
        ),
        Text(
          customValue ?? _formatRupiah(value),
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
