import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPerjanjianAdmin extends StatelessWidget {
  final Map<String, dynamic> perjanjian;

  const DetailPerjanjianAdmin({Key? key, required this.perjanjian})
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
                        'Detail Perjanjian',
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
                                      perjanjian['id'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      perjanjian['wajibRetribusi'],
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
                                    color: perjanjian['statusColor'],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    perjanjian['status'],
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

                    // Detail Perjanjian
                    Text(
                      'Informasi Perjanjian',
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
                            _buildInfoRow('Nama Penyewa',
                                perjanjian['wajibRetribusi']),
                            Divider(height: 16),
                            _buildInfoRow('Objek yang Disewa',
                                perjanjian['objek']),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Mulai',
                              perjanjian['tglMulai'],
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Berakhir',
                              perjanjian['tglSelesai'],
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Durasi',
                              _calculateDuration(perjanjian['tglMulai'],
                                  perjanjian['tglSelesai']),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Detail Harga
                    Text(
                      'Detail Harga & Pembayaran',
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
                              'Nominal Total',
                              perjanjian['nominalTotal'],
                              isBold: true,
                            ),
                            SizedBox(height: 12),
                            _buildPriceRow(
                              'DP Sudah Bayar (30%)',
                              perjanjian['dpBayar'],
                              color: Colors.green,
                            ),
                            Divider(height: 16),
                            _buildPriceRow(
                              'Sisa Pembayaran',
                              perjanjian['sisaBayar'],
                              isBold: true,
                              color: perjanjian['sisaBayar'] > 0
                                  ? Color(0xFFDC3545)
                                  : Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Dokumen Perjanjian
                    Text(
                      'Dokumen Perjanjian',
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
                              leading: Icon(Icons.picture_as_pdf,
                                  color: Colors.red),
                              title: Text(
                                'Perjanjian Sewa - ${perjanjian['id']}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'Tanggal Dibuat: 15 April 2026',
                                style: GoogleFonts.poppins(fontSize: 11),
                              ),
                              trailing: Icon(Icons.download),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Mendownload dokumen perjanjian...'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Syarat & Ketentuan
                    Text(
                      'Syarat & Ketentuan',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '1. Penyewa wajib menjaga kebersihan dan kondisi objek\n'
                        '2. Penggunaan objek sesuai dengan keperluan yang telah disetujui\n'
                        '3. Penyewa tidak boleh melakukan renovasi tanpa izin\n'
                        '4. Pembayaran DP dilakukan saat penandatanganan perjanjian\n'
                        '5. Sisa pembayaran dilakukan sebelum tanggal jatuh tempo\n'
                        '6. Keterlambatan pembayaran dikenakan denda 2% per hari\n'
                        '7. Perjanjian dapat dibatalkan jika ada pelanggaran syarat & ketentuan',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          height: 1.6,
                        ),
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
                              content: Text(
                                  'Dokumen perjanjian sedang didownload...'),
                            ),
                          );
                        },
                        icon: Icon(Icons.download),
                        label: Text('Download Perjanjian (PDF)'),
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

  Widget _buildPriceRow(String label, num value,
      {bool isBold = false, Color color = const Color(0xFF333333)}) {
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
          _formatRupiah(value),
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  String _calculateDuration(String? start, String? end) {
    // Simple calculation for demo
    return '15 hari';
  }
}
