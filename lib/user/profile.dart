import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/user/login.dart';
import 'service/api_service.dart';

class profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  String _namaLengkap = '';
  String _fotoUser = '';
  int _roleId = 0;
  int _idPersonal = 0;
  String _nik = '';
  String _nomorPonsel = '';
  String _alamat = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _namaLengkap = prefs.getString('namaLengkap') ?? 'Nama tidak ditemukan';
        _fotoUser = prefs.getString('fotoUser') ?? '';
        _roleId = prefs.getInt('roleId') ?? 0;
        _idPersonal = prefs.getInt('idPersonal') ?? 0;
        _alamat = prefs.getString('alamat') ?? '-';
      });

      final response = await ApiService.get('permohonan-mobile/${_idPersonal}');
      if (response['status'] == 200 &&
          response['permohonanSewa'] != null &&
          response['permohonanSewa'].isNotEmpty) {
        final userData = response['permohonanSewa'][0];
        setState(() {
          _nik = userData['nik'] ?? '-';
          _nomorPonsel = userData['nomorPonsel'] ?? '-';
          // Jika alamat juga dari API, bisa tambahkan di sini
          // _alamat = userData['alamat'] ?? _alamat;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        _nik = '-';
        _nomorPonsel = '-';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        height: screenHeight / 16 +
                            MediaQuery.of(context).padding.top,
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
                          'Profile',
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
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Center(
                        child: Icon(Icons.account_circle,
                            size: 120, color: Colors.black38),
                      ),
                      Text(
                        _namaLengkap,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Card dengan tombol edit di kanan atas
                      Stack(
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  leading:
                                      Icon(Icons.person_2, color: Colors.red),
                                  title: Text(
                                    'NIK',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  subtitle: Text(
                                    _nik,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.home, color: Colors.red),
                                  title: Text(
                                    'Alamat',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  subtitle: Text(
                                    _alamat,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.phone, color: Colors.red),
                                  title: Text(
                                    'Nomor Ponsel',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  subtitle: Text(
                                    _nomorPonsel,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app, color: Colors.red),
                          title: Text(
                            'Keluar',
                            style: GoogleFonts.roboto(
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                              (route) => false,
                            );
                          },
                        ),
                      ),
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
}
