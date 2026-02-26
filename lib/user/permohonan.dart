import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/buat-permohonan-baru.dart';
import 'package:tapatupa/user/tagihan.dart';
import 'RetributionListPage.dart';
import 'detail_permohonan.dart';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service/api_service.dart';

class permohonan extends StatefulWidget {
  @override
  _PermohonanState createState() => _PermohonanState();
}

class _PermohonanState extends State<permohonan> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    tagihans(),
    RetributionListPage(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.red.withOpacity(0.7),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: _pages[_currentIndex],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic>? _permohonanData;
  String? idPersonal;

  @override
  void initState() {
    super.initState();
    _loadIdPersonal(); // Load idPersonal first
    _tabController = TabController(length: 2, vsync: this);
  }

  // Load idPersonal from SharedPreferences
  Future<void> _loadIdPersonal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final idPersonal = prefs.getInt('idPersonal');

      if (!isLoggedIn || idPersonal == null) {
        Navigator.pushReplacementNamed(context, '/login');
        return;
      }

      await _fetchPermohonanData(idPersonal.toString());
    } catch (e) {
      print('Error loading data: $e');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  // Fetch permohonan data based on idPersonal
  Future<void> _fetchPermohonanData(String idPersonal) async {
    try {
      final response = await ApiService.get('permohonan-mobile/$idPersonal');

      if (response['status'] == 200) {
        setState(() {
          _permohonanData = response['permohonanSewa'];
        });
      }
    } catch (e) {
      print('Error fetching permohonan data: $e');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Header dengan gambar dan judul
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    height:
                        screenHeight / 16 + MediaQuery.of(context).padding.top,
                    width: double.infinity,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                      child: Image.asset(
                        'assets/gorgabatak.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight / 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Permohonan',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Riwayat Permohonan',
                      style: GoogleFonts.roboto(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Buat Permohonan',
                      style: GoogleFonts.roboto(color: Colors.black),
                    ),
                  ),
                ],
                indicatorColor: Colors.red,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            SizedBox(height: 10),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  // Tab Riwayat Permohonan
                  _permohonanData != null && _permohonanData!.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8), // Lebih kecil
                          itemCount: _permohonanData!.length,
                          itemBuilder: (context, index) {
                            final data = _permohonanData![index];
                            final cardColor = index % 2 == 0
                                ? Colors.grey[100]
                                : Colors.grey[50];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPermohonan(
                                      idPermohonanSewa:
                                          data['idPermohonanSewa']?.toString(),
                                      kodeObjekRetribusi:
                                          data['kodeObjekRetribusi']
                                              ?.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: cardColor,
                                margin:
                                    EdgeInsets.only(bottom: 8), // Lebih kecil
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10), // Lebih kecil
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nomor Surat di kiri, Status di kanan (sejajar)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'No. Permohonan - ${data['nomorSuratPermohonan'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: (data['namaStatus']
                                                          ?.toString()
                                                          .toLowerCase() ==
                                                      'baru')
                                                  ? Colors.green
                                                  : Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              data['namaStatus'] ??
                                                  'Loading...',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Kode Objek : ${data['kodeObjekRetribusi'] ?? '-'}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Jenis           : ${data['jenisPermohonan'] ?? '-'}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Tanggal       : ${data['tanggalDiajukan'] ?? '-'}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(child: Text('Data tidak tersedia')),

                  // Tab Buat Permohonan
                  Container(
                    child: Center(child: FormulirPermohonanBaru()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
