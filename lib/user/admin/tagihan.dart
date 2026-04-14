import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tapatupa/user/admin/detail_tagihan_admin.dart';

class tagihan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TagihanPage();
  }
}

class TagihanPage extends StatefulWidget {
  @override
  _TagihanPageState createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for Riwayat Tagihan
  final List<Map<String, dynamic>> riwayatTagihan = [
    {
      'nomor': 'TAG-2024-001',
      'jenis': 'Tagihan Retribusi Bulanan',
      'tanggal': '01 Januari 2024',
      'jatuhTempo': '15 Januari 2024',
      'status': 'Belum Bayar',
      'statusColor': Colors.orange,
      'nominal': 1500000,
      'objek': 'Toko Retail - Jl. Merdeka No. 45',
      'wajibRetribusi': 'Ahmad Supandi',
    },
    {
      'nomor': 'TAG-2024-002',
      'jenis': 'Tagihan Retribusi Bulanan',
      'tanggal': '02 Januari 2024',
      'jatuhTempo': '16 Januari 2024',
      'status': 'Lunas',
      'statusColor': Colors.green,
      'nominal': 850000,
      'objek': 'Toko Makanan - Jl. Sudirman No. 12',
      'wajibRetribusi': 'Siti Nurhaliza',
    },
    {
      'nomor': 'TAG-2024-003',
      'jenis': 'Tagihan Retribusi Bulanan',
      'tanggal': '03 Januari 2024',
      'jatuhTempo': '17 Januari 2024',
      'status': 'Belum Bayar',
      'statusColor': Colors.orange,
      'nominal': 2200000,
      'objek': 'Kantor Cabang - Jl. Gatot Subroto No. 88',
      'wajibRetribusi': 'PT Maju Jaya',
    },
    {
      'nomor': 'TAG-2024-004',
      'jenis': 'Tagihan Retribusi Bulanan',
      'tanggal': '05 Januari 2024',
      'jatuhTempo': '19 Januari 2024',
      'status': 'Lunas',
      'statusColor': Colors.green,
      'nominal': 1200000,
      'objek': 'Toko Pakaian - Jl. Ahmad Yani No. 30',
      'wajibRetribusi': 'Tini Handayani',
    },
    {
      'nomor': 'TAG-2024-005',
      'jenis': 'Tagihan Retribusi Bulanan',
      'tanggal': '06 Januari 2024',
      'jatuhTempo': '20 Januari 2024',
      'status': 'Belum Bayar',
      'statusColor': Colors.orange,
      'nominal': 1750000,
      'objek': 'Kafe Kopi - Jl. Diponegoro No. 15',
      'wajibRetribusi': 'Bambang Hermanto',
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

  String formatCurrency(int amount) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(amount);
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
            // Gorga Batak Style Header with Red Theme
            SliverAppBar(
              expandedHeight: screenHeight * 0.20,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    // Gorga Batak Pattern Top
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/gorgabatak.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Content
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long_outlined,
                              size: 35, color: Colors.white),
                          SizedBox(height: 6),
                          Text(
                            'TAGIHAN',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Kelola Tagihan Retribusi',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.95),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          'Riwayat Tagihan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Buat Tagihan',
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
        children: riwayatTagihan.map((item) {
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
                              item['wajibRetribusi'],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Text(
                        formatCurrency(item['nominal']),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDC3545),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailTagihanAdmin(
                              tagihan: item,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC3545),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
      'wajibRetribusi': 'Hendra Wijaya',
      'objekRetribusi': 'Toko Elektronik',
      'lokasi': 'Jl. Iskandar Muda No. 55',
      'periode': 'Februari 2024',
      'nominal': 1850000,
      'jatuhTempo': '15 Februari 2024',
      'keterangan': 'Tagihan retribusi tempat usaha toko elektronik',
    };

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form Information Card
          Container(
            padding: EdgeInsets.all(16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Tagihan Baru',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                _buildFormField(
                  'Wajib Retribusi',
                  formDataDummy['wajibRetribusi'] as String,
                ),
                _buildFormField(
                  'Objek Retribusi',
                  formDataDummy['objekRetribusi'] as String,
                ),
                _buildFormField(
                  'Lokasi',
                  formDataDummy['lokasi'] as String,
                ),
                _buildFormField(
                  'Periode Tagihan',
                  formDataDummy['periode'] as String,
                ),
                _buildFormField(
                  'Nominal',
                  formatCurrency(formDataDummy['nominal'] as int),
                ),
                _buildFormField(
                  'Jatuh Tempo',
                  formDataDummy['jatuhTempo'] as String,
                ),
                _buildFormField(
                  'Keterangan',
                  formDataDummy['keterangan'] as String,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Tagihan untuk ${formDataDummy['wajibRetribusi']} berhasil dibuat',
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDC3545),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Simpan Tagihan',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Buat tagihan baru direset'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[300]!, width: 1),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Reset Form',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String value) {
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
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey[300]!, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
