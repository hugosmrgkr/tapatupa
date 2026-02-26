import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/buat-permohonan-baru.dart';
import 'package:tapatupa/user/service/api_service.dart';
import 'package:tapatupa/user/tagihan.dart';
import 'RetributionListPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Bagian atas dengan gambar
                Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        height: screenHeight / 16 +
                            MediaQuery.of(context).padding.top,
                        width: double.infinity,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black
                                .withOpacity(0.5), // Menambahkan opacity
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
                Stack(
                  children: [
                    Container(
                      height: screenHeight,
                      child: TabBarView(
                        children: [
                          // Tab Baru (scrollable)
                          SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: _permohonanData != null &&
                                            _permohonanData!.isNotEmpty
                                        ? Column(
                                            children:
                                                _permohonanData!.map((data) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'No. Permohonan - ${data['nomorSuratPermohonan'] ?? 'Loading...'}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${data['jenisPermohonan'] ?? 'Loading...'}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              '${data['tanggalDiajukan'] ?? 'Loading...'}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        4),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Text(
                                                              data['namaStatus'] ??
                                                                  'Loading...',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey[300],
                                                    thickness: 1,
                                                  ),
                                                  SizedBox(height: 5),
                                                ],
                                              );
                                            }).toList(),
                                          )
                                        : Center(
                                            child: Text('Data tidak tersedia'),
                                          ),
                                  ),
                                  SizedBox(height: 220),
                                ],
                              ),
                            ),
                          ),

                          // Tab kedua
                          Container(
                            child: Center(child: FormulirPermohonanBaru()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
