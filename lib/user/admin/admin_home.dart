import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tapatupa/user/admin/detail-sewa.dart';
import 'package:tapatupa/user/admin/pembayaran-tagihan.dart';
import 'package:tapatupa/user/admin/perjanjian.dart';
import 'package:tapatupa/user/admin/permohonan.dart';
import 'package:tapatupa/user/admin/tagihan-baru.dart';
import 'package:tapatupa/user/admin/tarif-objek.dart';

import '../service/api_service.dart';
import 'RetributionListPage.dart'; // Import your RetributionListPage here

import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _currentIndex = 0; // This keeps track of the selected bottom nav item

  String _namaLengkap = '';
  String _fotoUser = '';
  int _roleId = 0;
  int _idPersonal = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaLengkap = prefs.getString('namaLengkap') ?? 'Nama tidak ditemukan';
      _fotoUser = prefs.getString('fotoUser') ?? '';
      _roleId = prefs.getInt('roleId') ?? 0;
      _idPersonal = prefs.getInt('idPersonal') ?? 0; // Memuat idPersonal
    });

    // Mencetak semua data ke konsol
    print('Nama Lengkap: $_namaLengkap');
    print('Foto User: $_fotoUser');
    print('Role ID: $_roleId');
    print('ID Personal: $_idPersonal');
  }

  Future<void> _handleLogout() async {
    try {
      await ApiService.logout();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  // Pages for BottomNavigationBar items
  final List<Widget> _pages = [
    HomePage(),
    permohonan(),
    TagihanBaru(), // For the 'Bayar' Page
    pembayaran_tagihan(), // For the 'History' Page
    // profile(), // The Profile Page
  ];

  final List<Widget> _navigationItem = [
    const Icon(Icons.home),
    const Icon(Icons.view_list),
    const Icon(Icons.account_balance_wallet),
    const Icon(Icons.history),
    const Icon(Icons.person),
  ];

  Color bgcolor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.red.withOpacity(0.7),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: _pages[_currentIndex], // Change the displayed page
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'Permohonan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Tagihan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Pembayaran',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index when tapped
            });
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final _homeState = context.findAncestorStateOfType<_AdminHomeState>();
    final namaLengkap = _homeState?._namaLengkap ?? 'User';

    // Add this function to fetch latest active invoice
    Future<Map<String, dynamic>?> _fetchLatestActiveInvoice() async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final idPersonal = prefs.getInt('idPersonal')?.toString();

        if (idPersonal == null) {
          throw Exception('User not logged in');
        }

        final response = await ApiService.get('tagihan-mobile/$idPersonal');

        if (response['status'] == 200 && response['tagihanSewa'] is List) {
          final tagihanList = response['tagihanSewa'] as List;
          // Find first active tagihan
          final activeTagihan = tagihanList.firstWhere(
            (tagihan) => tagihan['namaStatus'] == 'Perjanjian Aktif',
            orElse: () => null,
          );
          return activeTagihan;
        }
        return null;
      } catch (e) {
        print('Error fetching latest invoice: $e');
        return null;
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenHeight / 7 + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 196, 90, 90), // Dark Red
                    Color.fromARGB(255, 177, 45, 45), // Firebrick
                    Color.fromARGB(255, 189, 39, 69), // Crimson
                    Color.fromARGB(
                        255, 142, 26, 26), // Dark Red again for a darker touch
                  ],
                  stops: [0.1, 0.4, 0.7, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55),
                )),
            child: Stack(
              children: [
                // Lingkaran dekoratif
                Positioned(
                  top: 45,
                  left: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: -40,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 40,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                // Konten header
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar profil dalam lingkaran
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 110,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/logotapatupa.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Teks sambutan
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          // child: Text(
                          //   'Hi, $namaLengkap\nSelamat datang di Aplikasi\nObjek Retribusi Tapanuli Utara',
                          //   style: GoogleFonts.montserrat(
                          //     fontSize: 15,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ),
                      ),
                      // Ikon notifikasi
                      // IconButton(
                      //   onPressed: () {
                      //     print("Notifikasi ditekan");
                      //   },
                      //   icon: Icon(
                      //     Icons.notifications,
                      //     color: Colors.white,
                      //   ),
                      // ),

                      // Container(
                      //   width: 50,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     image: DecorationImage(
                      //       image: AssetImage(
                      //         'assets/miranda.JPG',
                      //       ),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  transform: Matrix4.translationValues(
                      1, -(screenHeight / 5 - 130), 0),
                ),
                Transform.translate(
                  offset: Offset(0, -80),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 370,
                          height: 110,
                          padding: EdgeInsets.all(19),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                  0.3,
                                ),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),

                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Expanded(
                          //       child: Column(
                          //         children: [
                          //           InkWell(
                          //             // Ganti GestureDetector dengan InkWell
                          //             onTap: () {
                          //               Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       RetributionListPage(),
                          //                 ),
                          //               );
                          //             },
                          //             child: Icon(Icons.home_work,
                          //                 size: 40, color: Colors.red),
                          //           ),
                          //           SizedBox(height: 10),
                          //           InkWell(
                          //             // Ganti GestureDetector dengan InkWell
                          //             onTap: () {
                          //               Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       RetributionListPage(),
                          //                 ),
                          //               );
                          //             },
                          //             child: Text(
                          //               'Objek Retribusi',
                          //               style: GoogleFonts.roboto(
                          //                 color: Colors.black,
                          //                 fontSize: 13,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 60,
                          //       width: 1,
                          //       color: Colors.grey,
                          //     ),
                          //     SizedBox(width: 15),
                          //     Expanded(
                          //       child: Column(
                          //         children: [
                          //           InkWell(
                          //             onTap: () {
                          //               Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       TarifObjekListPage(),
                          //                 ),
                          //               );
                          //             },
                          //             child: Icon(Icons.receipt_long,
                          //                 size: 40, color: Colors.red),
                          //           ),
                          //           SizedBox(height: 10),
                          //           InkWell(
                          //             onTap: () {
                          //               Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       TarifObjekListPage(),
                          //                 ),
                          //               );
                          //             },
                          //             child: Text(
                          //               'Tarif Objek',
                          //               style: GoogleFonts.roboto(
                          //                 color: Colors.black,
                          //                 fontSize: 13,
                          //               ),
                          //               textAlign: TextAlign.center,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 60,
                          //       width: 1,
                          //       color: Colors.grey,
                          //     ),
                          //     SizedBox(width: 15),
                          //     Expanded(
                          //       child: Column(
                          //         children: [
                          //           GestureDetector(
                          //             onTap: () => _navigateWithTransition(
                          //                 context, perjanjian()),
                          //             child: Icon(Icons.handshake_outlined,
                          //                 size: 40, color: Colors.red),
                          //           ),
                          //           SizedBox(height: 10),
                          //           GestureDetector(
                          //             onTap: () => _navigateWithTransition(
                          //                 context, perjanjian()),
                          //             child: Text(
                          //               'Perjanjian',
                          //               style: GoogleFonts.roboto(
                          //                 color: Colors.black,
                          //                 fontSize: 13,
                          //               ),
                          //               textAlign: TextAlign.center,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RetributionListPage(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.home_work,
                                              size: 40, color: Colors.red),
                                          SizedBox(height: 10),
                                          Text(
                                            'Objek Retribusi',
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TarifObjekListPage(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.receipt_long,
                                              size: 40, color: Colors.red),
                                          SizedBox(height: 10),
                                          Text(
                                            'Tarif Objek',
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () => _navigateWithTransition(
                                        context, perjanjian()),
                                    borderRadius: BorderRadius.circular(0),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.handshake_outlined,
                                              size: 40, color: Colors.red),
                                          SizedBox(height: 10),
                                          Text(
                                            'Perjanjian',
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Informasi Tagihan',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        FutureBuilder<Map<String, dynamic>?>(
                          future: _fetchLatestActiveInvoice(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData || snapshot.data == null) {
                              return Center(
                                child: Text(
                                  'Tidak ada tagihan aktif',
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                              );
                            }

                            final tagihan = snapshot.data!;

                            return Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Color.fromARGB(255, 255, 238, 238),
                                    Color.fromARGB(232, 255, 211, 211),
                                  ],
                                  stops: [0.1, 0.4, 0.7, 1.0],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tagihan terakhir anda',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('Nomor Perjanjian',
                                          style:
                                              GoogleFonts.roboto(fontSize: 15)),
                                      SizedBox(width: 30),
                                      Text(
                                          ': ${tagihan['nomorSuratPerjanjian'] ?? 'Loading...'}',
                                          style:
                                              GoogleFonts.roboto(fontSize: 15)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Objek',
                                          style:
                                              GoogleFonts.roboto(fontSize: 15)),
                                      SizedBox(width: 110),
                                      Text(
                                          ': ${tagihan['objekRetribusi'] ?? '-'}',
                                          style:
                                              GoogleFonts.roboto(fontSize: 15)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Jangka Waktu',
                                          style:
                                              GoogleFonts.roboto(fontSize: 15)),
                                      SizedBox(width: 51),
                                      Text(
                                        ': ${tagihan['durasiSewa'] ?? 'Loading...'}',
                                        style: GoogleFonts.roboto(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text('Kabupaten',
                                  //         style: GoogleFonts.montserrat(
                                  //             fontSize: 15)),
                                  //     SizedBox(width: 63),
                                  //     Text(': Tapanuli Utara',
                                  //         style: GoogleFonts.montserrat(
                                  //             fontSize: 15)),
                                  //   ],
                                  // ),
                                  SizedBox(height: 2),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Jumlah Tagihan          : ',
                                      style: GoogleFonts.roboto(fontSize: 15),
                                      children: [
                                        TextSpan(
                                          text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0,
                                          ).format(
                                              tagihan['jumlahPembayaran'] ?? 0),
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              detailPerjanjianSewa(
                                            id: tagihan['idPerjanjianSewa'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Lakukan Pembayaran',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(Icons.arrow_right,
                                              color: Colors.blue),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Status Permohonan Terbaru Anda!',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        CarouselStatus(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateWithTransition(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}

class CarouselStatus extends StatelessWidget {
  const CarouselStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getLatestPermohonan(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available'));
        }

        final data = snapshot.data!;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => permohonan()),
            );
          },
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 247, 247),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.insert_drive_file_outlined,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No. Permohonan - ${data['nomorSuratPermohonan']}',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${data['jenisPermohonan']}',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '${data['tanggalDiajukan']}',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                _getDisplayStatus(data['namaStatus']),
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Mohon tunggu Permohonan anda sedang ditinjau',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getDisplayStatus(String? originalStatus) {
    if (originalStatus?.toLowerCase() == 'baru') {
      return 'Diajukan';
    }
    return originalStatus ?? 'Unknown';
  }

  Future<Map<String, dynamic>> _getLatestPermohonan() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final idPersonal = prefs.getInt('idPersonal')?.toString();

      if (idPersonal == null) {
        throw Exception('User not logged in');
      }

      final response = await ApiService.get('permohonan-mobile/$idPersonal');

      if (response['status'] == 200 && response['permohonanSewa'] is List) {
        final permohonanList = response['permohonanSewa'] as List;
        if (permohonanList.isNotEmpty) {
          // Return the first (most recent) permohonan
          return permohonanList.first;
        }
      }

      throw Exception('No permohonan data available');
    } catch (e) {
      print('Error fetching latest permohonan: $e');
      throw e;
    }
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('This is the profile page'),
      ),
    );
  }
}
