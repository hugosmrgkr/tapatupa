import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tapatupa/user/admin/detail_pembayaran_admin.dart';

class pembayaran extends StatefulWidget {
  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<pembayaran>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _dummyPembayaranData = [
    {
      'id': 'PB-2024-001',
      'noInvoice': 'INV-2024-0001',
      'wajibRetribusi': 'PT Mitra Utama',
      'objekRetribusi': 'Kios Pasar',
      'totalBayar': 2500000,
      'tanggalBayar': '2024-01-15',
      'status': 'Lunas',
      'statusColor': Colors.green,
    },
    {
      'id': 'PB-2024-002',
      'noInvoice': 'INV-2024-0002',
      'wajibRetribusi': 'Toko Bangunan Jaya',
      'objekRetribusi': 'Toko Kelontong',
      'totalBayar': 1500000,
      'tanggalBayar': '2024-02-10',
      'status': 'Lunas',
      'statusColor': Colors.green,
    },
    {
      'id': 'PB-2024-003',
      'noInvoice': 'INV-2024-0003',
      'wajibRetribusi': 'Restoran Medan',
      'objekRetribusi': 'Restoran',
      'totalBayar': 5000000,
      'tanggalBayar': '2024-02-20',
      'status': 'Menunggu',
      'statusColor': Colors.orange,
    },
    {
      'id': 'PB-2024-004',
      'noInvoice': 'INV-2024-0004',
      'wajibRetribusi': 'CV Transportasi',
      'objekRetribusi': 'Armada Kendaraan',
      'totalBayar': 3750000,
      'tanggalBayar': '2024-03-05',
      'status': 'Lunas',
      'statusColor': Colors.green,
    },
    {
      'id': 'PB-2024-005',
      'noInvoice': 'INV-2024-0005',
      'wajibRetribusi': 'Salon Kecantikan Prima',
      'objekRetribusi': 'Salon & Kecantikan',
      'totalBayar': 1200000,
      'tanggalBayar': '2024-03-12',
      'status': 'Menunggu',
      'statusColor': Colors.orange,
    },
    {
      'id': 'PB-2024-006',
      'noInvoice': 'INV-2024-0006',
      'wajibRetribusi': 'Bengkel Motor Sejahtera',
      'objekRetribusi': 'Bengkel Kendaraan',
      'totalBayar': 2200000,
      'tanggalBayar': '2024-03-18',
      'status': 'Lunas',
      'statusColor': Colors.green,
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

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 32, color: Colors.white.withOpacity(0.9)),
                        SizedBox(height: 8),
                        Text(
                          'PEMBAYARAN',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Kelola pembayaran retribusi Anda',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFFDC3545),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFFDC3545),
                  indicatorWeight: 3,
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(text: 'Riwayat Pembayaran'),
                    Tab(text: 'Verifikasi Pembayaran'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // Tab 1: Riwayat Pembayaran
            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _dummyPembayaranData.length,
              itemBuilder: (context, index) {
                final pembayaran = _dummyPembayaranData[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.withOpacity(0.08), width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                pembayaran['noInvoice'],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: pembayaran['statusColor'],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                pembayaran['status'],
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          pembayaran['wajibRetribusi'],
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pembayaran['objekRetribusi'],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              _formatRupiah(pembayaran['totalBayar']),
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFDC3545),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tanggal: ${pembayaran['tanggalBayar']}',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPembayaranAdmin(
                                        pembayaran: pembayaran,
                                      ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDC3545),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Lihat Detail',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
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
              },
            ),
            // Tab 2: Verifikasi Pembayaran
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verifikasi Pembayaran Manual',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'No. Referensi Pembayaran',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'No. Invoice',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Jumlah Pembayaran',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.poppins(fontSize: 13),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 12),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Tanggal Pembayaran',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.poppins(fontSize: 13),
                          readOnly: true,
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Pembayaran berhasil diverifikasi',
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
                              'Verifikasi Pembayaran',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
