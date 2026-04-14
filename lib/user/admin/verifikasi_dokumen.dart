import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifikasiDokumenPage extends StatefulWidget {
  @override
  State<VerifikasiDokumenPage> createState() => _VerifikasiDokumenPageState();
}

class _VerifikasiDokumenPageState extends State<VerifikasiDokumenPage> with TickerProviderStateMixin {
  late TabController _tabController;
  String _filterStatus = 'Semua';

  final List<Map<String, dynamic>> dokumenList = [
    {'nomor': 'PRM-2024-050', 'nama': 'PT Bumi Jaya', 'status': 'Menunggu Verifikasi', 'dokumen': ['KTP', 'Domisili', 'Surat Kuasa'], 'tglSubmit': '10 Apr 2024', 'petugas': '-'},
    {'nomor': 'PRM-2024-049', 'nama': 'CV Konstruksi Utama', 'status': 'Terverifikasi', 'dokumen': ['KTP', 'Domisili'], 'tglSubmit': '09 Apr 2024', 'petugas': 'Budi Santoso'},
    {'nomor': 'PRM-2024-048', 'nama': 'Toko Roti Berkah', 'status': 'Ditolak', 'dokumen': ['KTP'], 'tglSubmit': '08 Apr 2024', 'petugas': 'Siti Nurhaliza'},
    {'nomor': 'PRM-2024-047', 'nama': 'Kantor Konsultan ABC', 'status': 'Menunggu Verifikasi', 'dokumen': ['KTP', 'Domisili', 'Surat Kuasa', 'NPB'], 'tglSubmit': '07 Apr 2024', 'petugas': '-'},
    {'nomor': 'PRM-2024-046', 'nama': 'Warung Makan Sederhana', 'status': 'Terverifikasi', 'dokumen': ['KTP'], 'tglSubmit': '06 Apr 2024', 'petugas': 'Bambang Suryanto'},
  ];

  List<Map<String, dynamic>> get filteredList {
    if (_filterStatus == 'Semua') return dokumenList;
    return dokumenList.where((item) => item['status'] == _filterStatus).toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Menunggu Verifikasi':
        return Colors.orange;
      case 'Terverifikasi':
        return Colors.green;
      case 'Ditolak':
        return Colors.red;
      case 'Perlu Revisi':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Menunggu Verifikasi':
        return Icons.schedule;
      case 'Terverifikasi':
        return Icons.check_circle;
      case 'Ditolak':
        return Icons.cancel;
      case 'Perlu Revisi':
        return Icons.edit;
      default:
        return Icons.help;
    }
  }

  void _showDetailDokumen(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFDC3545),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Detail Verifikasi Dokumen', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                            SizedBox(height: 4),
                            Text(item['nomor'], style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Icon(Icons.close, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Nomor Permohonan', item['nomor']),
                      SizedBox(height: 12),
                      _buildInfoRow('Nama Pemohon', item['nama']),
                      SizedBox(height: 12),
                      _buildInfoRow('Tanggal Submisi', item['tglSubmit']),
                      SizedBox(height: 12),
                      _buildInfoRow('Status', item['status']),
                      SizedBox(height: 20),
                      Divider(color: Colors.grey[300], height: 1),
                      SizedBox(height: 20),
                      Text('Dokumen Submitted', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black87)),
                      SizedBox(height: 12),
                      ...(item['dokumen'] as List<String>).asMap().entries.map((entry) {
                        final index = entry.key;
                        final docName = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () => _showDocumentPreview(docName, item['nomor']),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDC3545).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(Icons.description, color: Color(0xFFDC3545), size: 20),
                                      ),
                                      SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(docName, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700)),
                                          SizedBox(height: 2),
                                          Text('2.5 MB • PDF', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600])),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 20),
                      Divider(color: Colors.grey[300], height: 1),
                      SizedBox(height: 20),
                      Text('Catatan Verifikasi', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black87)),
                      SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Tambahkan catatan untuk verifikasi...',
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400]),
                          ),
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (item['status'] == 'Menunggu Verifikasi')
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => _showRejectDialog(ctx, item),
                                icon: Icon(Icons.close),
                                label: Text('Tolak', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[100],
                                  foregroundColor: Colors.red[700],
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => _showApproveDialog(ctx, item),
                                icon: Icon(Icons.check),
                                label: Text('Terima', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showApproveDialog(BuildContext ctx, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Terima Dokumen', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        content: Text('Anda yakin akan menerima dokumen dari ${item['nama']}?', style: GoogleFonts.poppins(fontSize: 13)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: Text('Batal', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Dokumen diterima!', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.green, duration: Duration(seconds: 2)),
              );
              setState(() {});
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: Text('Terima', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext ctx, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Tolak Dokumen', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Alasan penolakan', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey[600])),
            SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Jelaskan alasan penolakan...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400]),
              ),
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: Text('Batal', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Dokumen ditolak!', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.red, duration: Duration(seconds: 2)),
              );
              setState(() {});
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: Text('Tolak', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDocumentPreview(String docName, String nomor) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(docName, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () => Navigator.pop(ctx),
                    child: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.picture_as_pdf, size: 80, color: Colors.grey[400]),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download),
                      label: Text('Download', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC3545),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.open_in_new),
                      label: Text('Buka', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500)),
        Flexible(
          child: Text(value, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700), textAlign: TextAlign.end, maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: screenHeight * 0.18,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFDC3545), Color(0xFF8B0000)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.fact_check_outlined, color: Colors.white.withOpacity(0.9), size: 36),
                      SizedBox(height: 8),
                      Text('VERIFIKASI DOKUMEN', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.5)),
                      SizedBox(height: 2),
                      Text('Kelola dan verifikasi dokumen permohonan', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.85))),
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
              splashFactory: NoSplash.splashFactory,
              tabs: const [Tab(text: 'Daftar Dokumen'), Tab(text: 'Statistik')],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Daftar Dokumen
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Filter Status', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700)),
                            SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildFilterChip('Semua'),
                                  _buildFilterChip('Menunggu Verifikasi'),
                                  _buildFilterChip('Terverifikasi'),
                                  _buildFilterChip('Ditolak'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final item = filteredList[index];
                            return GestureDetector(
                              onTap: () => _showDetailDokumen(item),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 12, spreadRadius: 0, offset: Offset(0, 4))],
                                  border: Border.all(color: Colors.grey.withOpacity(0.05), width: 1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(item['nomor'], style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700)),
                                                SizedBox(height: 4),
                                                Text(item['nama'], style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey[600]), maxLines: 1, overflow: TextOverflow.ellipsis),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: _getStatusColor(item['status']).withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: _getStatusColor(item['status']).withOpacity(0.3)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(_getStatusIcon(item['status']), size: 12, color: _getStatusColor(item['status'])),
                                                SizedBox(width: 4),
                                                Text(item['status'], style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w700, color: _getStatusColor(item['status']))),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Divider(color: Colors.grey[200], height: 1),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Dokumen Submitted', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                                              SizedBox(height: 4),
                                              Text('${item['dokumen'].length} File', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w700)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('Tgl Submisi', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                                              SizedBox(height: 4),
                                              Text(item['tglSubmit'], style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w700)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Tab 2: Statistik
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ringkasan Verifikasi', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700)),
                      SizedBox(height: 16),
                      _buildStatCard('Menunggu Verifikasi', dokumenList.where((e) => e['status'] == 'Menunggu Verifikasi').length.toString(), Colors.orange, Icons.schedule),
                      _buildStatCard('Terverifikasi', dokumenList.where((e) => e['status'] == 'Terverifikasi').length.toString(), Colors.green, Icons.check_circle),
                      _buildStatCard('Ditolak', dokumenList.where((e) => e['status'] == 'Ditolak').length.toString(), Colors.red, Icons.cancel),
                      _buildStatCard('Total', dokumenList.length.toString(), Colors.blue, Icons.file_present),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _filterStatus == label;
    return GestureDetector(
      onTap: () => setState(() => _filterStatus = label),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFDC3545) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Color(0xFFDC3545) : Colors.grey[300]!),
        ),
        child: Text(label, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Colors.grey[700])),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 12, spreadRadius: 0, offset: Offset(0, 4))], border: Border.all(color: color.withOpacity(0.1), width: 1)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                SizedBox(height: 4),
                Text(value, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w800, color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
