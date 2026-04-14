import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/admin/detail_permohonan_admin.dart';

class permohonan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PermohonanPage();
  }
}

class PermohonanPage extends StatefulWidget {
  @override
  _PermohonanPageState createState() => _PermohonanPageState();
}

class _PermohonanPageState extends State<PermohonanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for Riwayat Permohonan
  final List<Map<String, dynamic>> riwayatPermohonan = [
    {
      'nomor': 'PRM-2024-001',
      'jenis': 'Permohonan Izin Tempat Usaha',
      'tanggal': '15 Januari 2024',
      'status': 'Disetujui',
      'statusColor': Colors.green,
      'objek': 'Toko Retail',
      'lokasi': 'Jl. Merdeka No. 45',
    },
    {
      'nomor': 'PRM-2024-002',
      'jenis': 'Permohonan Pengurusan Dokumen',
      'tanggal': '18 Januari 2024',
      'status': 'Verifikasi',
      'statusColor': Colors.blue,
      'objek': 'Toko Makanan',
      'lokasi': 'Jl. Sudirman No. 12',
    },
    {
      'nomor': 'PRM-2024-003',
      'jenis': 'Permohonan Perpanjangan',
      'tanggal': '20 Januari 2024',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'objek': 'Kantor Cabang',
      'lokasi': 'Jl. Gatot Subroto No. 88',
    },
    {
      'nomor': 'PRM-2024-004',
      'jenis': 'Permohonan Izin Tempat Usaha',
      'tanggal': '22 Januari 2024',
      'status': 'Ditolak',
      'statusColor': Colors.red,
      'objek': 'Toko Pakaian',
      'lokasi': 'Jl. Ahmad Yani No. 30',
    },
    {
      'nomor': 'PRM-2024-005',
      'jenis': 'Permohonan Revisi Data',
      'tanggal': '25 Januari 2024',
      'status': 'Disetujui',
      'statusColor': Colors.green,
      'objek': 'Kafe Kopi',
      'lokasi': 'Jl. Diponegoro No. 15',
    },
  ];

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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            // Premium Red Gradient Header
            SliverAppBar(
              expandedHeight: screenHeight * 0.14,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.description_outlined,
                          size: 36, color: Colors.white.withOpacity(0.9)),
                      SizedBox(height: 10),
                      Text(
                        'PERMOHONAN',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Kelola permohonan retribusi Anda',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Riwayat Permohonan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Buat Permohonan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                    labelColor: Color(0xFFDC3545),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFFDC3545),
                    indicatorWeight: 3,
                  ),
                ),
              ),
            ),
            // Tab Content
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildRiwayatTab(),
                    _buildBuatTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiwayatTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: riwayatPermohonan.map((item) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: Colors.grey.withOpacity(0.05),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['nomor'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item['jenis'],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: item['statusColor'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item['status'],
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: item['statusColor'],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(color: Colors.grey[200], height: 1),
                  SizedBox(height: 12),
                  // Detail Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 16, color: Colors.grey[500]),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['objek'],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              item['lokasi'],
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 14, color: Colors.grey[500]),
                      SizedBox(width: 6),
                      Text(
                        item['tanggal'],
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Build comprehensive permohonan data to pass to detail page
                        final permohonanData = {
                          'id': item['nomor'],
                          'status': item['status'],
                          'wajibRetribusi': 'PT. Mitra Bisnis Utama',
                          'objekRetribusi': item['objek'],
                          'keperluan': 'Kegiatan Usaha Retail',
                          'tglMulai': '15 April 2026',
                          'tglSelesai': '30 April 2026',
                          'durasi': '15 hari',
                          'tarifPerHari': 500000,
                          'subtotal': 7500000,
                          'dp': 2250000,
                          'sisaPembayaran': 5250000,
                          'catatan': 'Permohonan untuk kebutuhan usaha retail jangka pendek.'
                        };
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPermohonanAdmin(
                              permohonan: permohonanData,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC3545),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Lihat Detail',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBuatTab() {
    final formDataDummy = {
      'jenisPermohonan': 'Permohonan Izin Tempat Usaha',
      'namaObjek': 'Toko Kelontong',
      'lokasi': 'Jl. Gatot Subroto No. 100',
      'pemilik': 'Budi Santoso',
      'nomorIdentitas': '3271019910051234',
      'telepon': '0812-3456-7890',
      'keterangan': 'Permohonan izin tempat usaha toko kelontong',
    };

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          // Form Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Permohonan Baru',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Isikan data permohonan retribusi',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildFormField('Jenis Permohonan', formDataDummy['jenisPermohonan']!),
                  _buildFormField('Nama Objek Retribusi', formDataDummy['namaObjek']!),
                  _buildFormField('Lokasi', formDataDummy['lokasi']!),
                  _buildFormField('Nama Pemilik', formDataDummy['pemilik']!),
                  _buildFormField('Nomor Identitas', formDataDummy['nomorIdentitas']!),
                  _buildFormField('Nomor Telepon', formDataDummy['telepon']!),
                  _buildFormField('Keterangan', formDataDummy['keterangan']!, maxLines: 3),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Permohonan dibatalkan'),
                                backgroundColor: Colors.grey[600],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Batal',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Permohonan berhasil dikirim!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD32F2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Kirim',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String value, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            controller: TextEditingController(text: value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: Color(0xFFD32F2F), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
