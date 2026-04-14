import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailTagihanAdmin extends StatefulWidget {
  final Map<String, dynamic> tagihan;

  const DetailTagihanAdmin({Key? key, required this.tagihan}) : super(key: key);

  @override
  _DetailTagihanAdminState createState() => _DetailTagihanAdminState();
}

class _DetailTagihanAdminState extends State<DetailTagihanAdmin> {
  late Map<String, dynamic> _tagihan;

  @override
  void initState() {
    super.initState();
    _tagihan = widget.tagihan;
  }

  String _formatRupiah(num value) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  void _showMarkAsPaidDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Verifikasi Pembayaran Manual',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukkan informasi pembayaran manual:',
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Referensi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Catatan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              style: GoogleFonts.poppins(),
              minLines: 2,
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _tagihan['status'] = 'Lunas';
                _tagihan['tanggalBayar'] = DateTime.now().toString();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Tagihan berhasil diverifikasi dan ditandai LUNAS',
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFDC3545),
            ),
            child: Text(
              'Tandai Lunas',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
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
                        'Detail Tagihan',
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
                                      _tagihan['nomor'] ?? 'TAG-2024-001',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _tagihan['wajibRetribusi'] ?? '-',
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
                                    color: (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                        ? Colors.green
                                        : Colors.orange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _tagihan['status'] ?? 'Belum Bayar',
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

                    // Detail Tagihan
                    Text(
                      'Informasi Tagihan',
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
                              'Nama Pemilik',
                              _tagihan['wajibRetribusi'] ?? '-',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Objek Retribusi',
                              _tagihan['objek'] ?? '-',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Tagihan',
                              _tagihan['tanggal'] ?? '15 April 2026',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Jatuh Tempo',
                              _tagihan['jatuhTempo'] ?? '25 April 2026',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Nomor Perjanjian',
                              _tagihan['noPerjanjian'] ?? 'AGR-2026-0001',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Detail Pembayaran
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
                              'Nominal Tagihan',
                              _tagihan['nominal'] ?? 0,
                              isBold: true,
                            ),
                            if ((_tagihan['status'] ?? 'Belum Bayar') == 'Lunas') ...[
                              SizedBox(height: 12),
                              _buildPriceRow(
                                'Tanggal Bayar',
                                0,
                                customValue: _tagihan['tanggalBayar'] ??
                                    DateTime.now().toString().split(' ')[0],
                              ),
                              SizedBox(height: 12),
                              _buildPriceRow(
                                'Jumlah Terbayar',
                                _tagihan['nominal'] ?? 0,
                                color: Colors.green,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Status Pembayaran
                    Text(
                      'Status Pembayaran',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                        color: (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                            ? Colors.green[50]
                            : Colors.orange[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                    ? Icons.check_circle
                                    : Icons.pending,
                                color: (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                    ? Colors.green
                                    : Colors.orange,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                    ? 'LUNAS'
                                    : 'BELUM BAYAR',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            (_tagihan['status'] ?? 'Belum Bayar') == 'Lunas'
                                ? 'Pembayaran telah diterima dan diverifikasi'
                                : 'Menunggu pembayaran dari penyewa',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Bukti Pembayaran (if paid)
                    if ((_tagihan['status'] ?? 'Belum Bayar') == 'Lunas')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    leading: Icon(Icons.picture_as_pdf,
                                        color: Colors.red),
                                    title: Text(
                                      'Bukti Pembayaran - ${_tagihan['nomor'] ?? 'TAG-2024-001'}',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      'VA: ${_tagihan['nomorVa'] ?? '12345 6789012 3456 7'}',
                                      style: GoogleFonts.poppins(fontSize: 11),
                                    ),
                                    trailing: Icon(Icons.download),
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Mendownload bukti pembayaran...'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),

                    // Action Buttons
                    if ((_tagihan['status'] ?? 'Belum Bayar') == 'Belum Bayar')
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _showMarkAsPaidDialog,
                              icon: Icon(Icons.check_circle),
                              label: Text('Tandai Lunas (Verifikasi Manual)'),
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
                        ],
                      ),

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
