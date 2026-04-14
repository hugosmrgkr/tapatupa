import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPermohonanAdmin extends StatefulWidget {
  final Map<String, dynamic> permohonan;

  const DetailPermohonanAdmin({Key? key, required this.permohonan})
      : super(key: key);

  @override
  _DetailPermohonanAdminState createState() => _DetailPermohonanAdminState();
}

class _DetailPermohonanAdminState extends State<DetailPermohonanAdmin> {
  late Map<String, dynamic> _permohonan;

  @override
  void initState() {
    super.initState();
    _permohonan = widget.permohonan;
  }

  String _formatRupiah(num value) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Diajukan':
        return Colors.orange;
      case 'Verifikasi':
        return Colors.blue;
      case 'Disetujui':
        return Colors.green;
      case 'Ditolak':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showApproveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Setujui Permohonan',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Yakin ingin menyetujui permohonan ini?\n\nSistem akan otomatis membuat:',
          style: GoogleFonts.poppins(),
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
                _permohonan['status'] = 'Disetujui';
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Permohonan #${_permohonan['id']} berhasil disetujui!\nPerjanjian & Tagihan otomatis dibuat.',
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                ),
              );
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFDC3545),
            ),
            child: Text(
              'Setujui',
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

  void _showRejectDialog() {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Tolak Permohonan',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Masukkan alasan penolakan:',
              style: GoogleFonts.poppins(),
            ),
            SizedBox(height: 12),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                hintText: 'Alasan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              minLines: 3,
              maxLines: 5,
              style: GoogleFonts.poppins(),
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
              if (reasonController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Masukkan alasan penolakan')),
                );
                return;
              }
              Navigator.pop(context);
              setState(() {
                _permohonan['status'] = 'Ditolak';
                _permohonan['rejectionReason'] = reasonController.text;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Permohonan #${_permohonan['id']} berhasil ditolak. Notifikasi dikirim ke pemohon.',
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Tolak',
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
                        'Detail Permohonan',
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
                    // Header Info
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
                                      _permohonan['id'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _permohonan['wajibRetribusi'] ?? '-',
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
                                    color: _getStatusColor(_permohonan['status']),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _permohonan['status'],
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

                    // Informasi Pemohon
                    Text(
                      'Informasi Pemohon',
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
                            _buildInfoRow('Nama', _permohonan['wajibRetribusi']),
                            Divider(height: 16),
                            _buildInfoRow('No. Identitas', '317187012018001'),
                            Divider(height: 16),
                            _buildInfoRow('Alamat', 'Jl. Merdeka No. 123'),
                            Divider(height: 16),
                            _buildInfoRow('Telepon', '+62-812-3456-7890'),
                            Divider(height: 16),
                            _buildInfoRow('Email', 'pemohon@email.com'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Detail Permohonan
                    Text(
                      'Detail Permohonan',
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
                            _buildInfoRow('Objek Retribusi',
                                _permohonan['objekRetribusi']),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Mulai',
                              _permohonan['tglMulai'] ?? '15 April 2026',
                            ),
                            Divider(height: 16),
                            _buildInfoRow(
                              'Tanggal Selesai',
                              _permohonan['tglSelesai'] ?? '30 April 2026',
                            ),
                            Divider(height: 16),
                            _buildInfoRow('Durasi', _permohonan['durasi'] ?? '15 hari'),
                            Divider(height: 16),
                            _buildInfoRow('Keperluan', _permohonan['keperluan']),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Dokumen
                    Text(
                      'Dokumen Pendukung',
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
                            _buildDocumentRow('KTP', 'document_ktp.pdf'),
                            SizedBox(height: 12),
                            _buildDocumentRow(
                                'Surat Domisili', 'document_domisili.pdf'),
                            SizedBox(height: 12),
                            _buildDocumentRow(
                                'Surat Izin Usaha', 'document_surat.pdf'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Harga
                    Text(
                      'Detail Harga',
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
                              'Tarif Per Hari',
                              _permohonan['tarifPerHari'] ?? 500000,
                            ),
                            SizedBox(height: 8),
                            _buildPriceRow(
                              'Durasi (15 hari)',
                              (_permohonan['tarifPerHari'] ?? 500000) * 15,
                            ),
                            Divider(height: 16),
                            _buildPriceRow(
                              'Subtotal',
                              _permohonan['subtotal'] ?? 7500000,
                              isBold: true,
                            ),
                            SizedBox(height: 8),
                            _buildPriceRow(
                              'DP (30%)',
                              _permohonan['dp'] ?? 2250000,
                            ),
                            Divider(height: 16),
                            _buildPriceRow(
                              'Sisa Pembayaran',
                              _permohonan['sisaPembayaran'] ?? 5250000,
                              isBold: true,
                              color: Color(0xFFDC3545),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Catatan
                    if (_permohonan['catatan'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan Tambahan',
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
                              _permohonan['catatan'],
                              style: GoogleFonts.poppins(fontSize: 13),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),

                    // Alasan Penolakan (Jika ada)
                    if (_permohonan['status'] == 'Ditolak' &&
                        _permohonan['rejectionReason'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alasan Penolakan',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red[300]!),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red[50],
                            ),
                            child: Text(
                              _permohonan['rejectionReason'],
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.red[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),

                    // Action Buttons
                    if (_permohonan['status'] == 'Diajukan' ||
                        _permohonan['status'] == 'Verifikasi')
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _showRejectDialog,
                                  icon: Icon(Icons.close),
                                  label: Text('Tolak'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _showApproveDialog,
                                  icon: Icon(Icons.check),
                                  label: Text('Setujui'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFDC3545),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                        ],
                      )
                    else
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

  Widget _buildInfoRow(String label, String value) {
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
            value,
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

  Widget _buildDocumentRow(String name, String filename) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.picture_as_pdf, color: Colors.red, size: 20),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  filename,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.download, color: Color(0xFFDC3545)),
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
}
