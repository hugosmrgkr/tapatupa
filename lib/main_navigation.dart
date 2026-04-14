import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/permohonan.dart';
import 'package:tapatupa/user/tagihan.dart';
import 'package:tapatupa/user/pembayaran.dart';
import 'package:tapatupa/user/profile.dart';
import 'package:tapatupa/user/aset_retribusi.dart';
import 'package:tapatupa/user/tarif_sewa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePageFinal(),
      PermohonanPage(),
      TagihanPage(),
      PembayaranPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description),
            label: 'Permohonan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Tagihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Pembayaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Color(0xFFDC3545),
        unselectedItemColor: Colors.grey[600],
      ),
    );
  }
}

/// UC-03: Dashboard Home - Masyarakat Dashboard
/// Menampilkan ringkasan informasi pengguna, quick stats, dan menu navigasi utama
class HomePageFinal extends StatefulWidget {
  @override
  _HomePageFinalState createState() => _HomePageFinalState();
}

class _HomePageFinalState extends State<HomePageFinal> {
  String _userName = 'Pengguna';
  int _permohonanCount = 0;
  int _tagihanCount = 0;
  int _aktivCount = 0;

  // Dummy data
  late List<Map<String, dynamic>> _recentTagihan;
  late List<Map<String, dynamic>> _recentPermohonan;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _initializeDummyData();
  }

  void _initializeDummyData() {
    _permohonanCount = 5;
    _tagihanCount = 3;
    _aktivCount = 2;

    _recentTagihan = [
      {
        'nomor': '973/217/SP/',
        'tanggal': '5 Februari 2021',
        'objek': '120206010 - Sewa Tanah',
        'nominal': 'Rp 192.290',
        'status': 'Belum Bayar',
        'statusColor': Colors.orange,
      },
      {
        'nomor': '974/218/SP/',
        'tanggal': '6 Februari 2021',
        'objek': '120206015 - Sewa Tempat Usaha',
        'nominal': 'Rp 250.000',
        'status': 'Lunas',
        'statusColor': Colors.green,
      },
    ];

    _recentPermohonan = [
      {
        'nomor': 'PRJ-2024-001',
        'objek': '120206010 - Sewa Tanah',
        'lokasi': 'Jl. Merdeka No. 45',
        'status': 'Diverifikasi',
        'statusColor': Color(0xFF1976D2),
        'tglAjukan': '01 Januari 2024',
      },
      {
        'nomor': 'PRJ-2024-002',
        'objek': '120206015 - Sewa Tempat Usaha',
        'lokasi': 'Jl. Sudirman No. 12',
        'status': 'Diajukan',
        'statusColor': Color(0xFFFFA726),
        'tglAjukan': '02 Januari 2024',
      },
    ];
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _userName = prefs.getString('namaLengkap') ?? 'Pengguna';
      });
    } catch (e) {
      // Handle error silently
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Red Gradient Header dengan Profile
            Container(
              height: screenHeight * 0.16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat Datang,',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.white.withOpacity(0.85),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  _userName,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'TAPATUPA',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Quick Stats Section
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: _QuickStatCard(
                      icon: Icons.description_outlined,
                      label: 'Permohonan',
                      value: _permohonanCount.toString(),
                      color: Color(0xFFEC407A),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _QuickStatCard(
                      icon: Icons.receipt_outlined,
                      label: 'Tagihan',
                      value: _tagihanCount.toString(),
                      color: Color(0xFFFDD835),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _QuickStatCard(
                      icon: Icons.assignment_outlined,
                      label: 'Aktif',
                      value: _aktivCount.toString(),
                      color: Color(0xFF66BB6A),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Utama Section
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Menu Utama',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _MenuCard(
                          title: 'Aset Retribusi',
                          icon: Icons.home_work_outlined,
                          gradientStart: Color(0xFFEC407A),
                          gradientEnd: Color(0xFFC2185B),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AssetRetribusiPage()),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MenuCard(
                          title: 'Tarif Sewa',
                          icon: Icons.monetization_on_outlined,
                          gradientStart: Color(0xFFFDD835),
                          gradientEnd: Color(0xFFF9A825),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TarifSewaPage()),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MenuCard(
                          title: 'Perjanjian',
                          icon: Icons.assignment_outlined,
                          gradientStart: Color(0xFF66BB6A),
                          gradientEnd: Color(0xFF2E7D32),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Lihat di menu Tagihan')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Ringkasan Informasi Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Color(0xFFDC3545),
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Ringkasan Tagihan',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  ..._recentTagihan.map((tagihan) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(color: Colors.grey.shade100, width: 1),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. ${tagihan['nomor']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: tagihan['statusColor'].withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      tagihan['status'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: tagihan['statusColor'],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                tagihan['objek'],
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    tagihan['tanggal'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    tagihan['nominal'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1976D2),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Status Permohonan Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Color(0xFFDC3545),
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Status Permohonan Terbaru',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  ..._recentPermohonan.map((permohonan) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(color: Colors.grey.shade100, width: 1),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    permohonan['nomor'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: permohonan['statusColor'].withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      permohonan['status'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: permohonan['statusColor'],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                permohonan['objek'],
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      permohonan['lokasi'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[500],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    permohonan['tglAjukan'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick Stat Card Widget
class _QuickStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _QuickStatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade100, width: 1),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(icon, size: 18, color: color),
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Menu Card Widget
class _MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color gradientStart;
  final Color gradientEnd;
  final VoidCallback onTap;

  const _MenuCard({
    required this.title,
    required this.icon,
    required this.gradientStart,
    required this.gradientEnd,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 28, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
