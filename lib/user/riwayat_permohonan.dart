import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/buat-permohonan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service/api_service.dart';

class RiwayatPermohonan extends StatefulWidget {
  @override
  _RiwayatPermohonanState createState() => _RiwayatPermohonanState();
}

class _RiwayatPermohonanState extends State<RiwayatPermohonan> {
  List<dynamic>? _permohonanData;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadIdPersonal();
  }

  Future<void> _loadIdPersonal() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final idPersonal = prefs.getInt('idPersonal');

      if (!isLoggedIn || idPersonal == null) {
        Navigator.pushReplacementNamed(context, '/login');
        return;
      }

      print('Loading data for idPersonal: $idPersonal');
      await _fetchPermohonanData(idPersonal.toString());
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        _errorMessage = 'Gagal memuat data';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchPermohonanData(String idPersonal) async {
    try {
      final response = await ApiService.get('permohonan-mobile/$idPersonal');

      if (response['status'] == 200) {
        setState(() {
          _permohonanData = response['permohonanSewa'];
          _errorMessage = '';
        });
        print('Data loaded: ${_permohonanData?.length} items');
      } else {
        throw Exception('Failed to load data: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching riwayat permohonan: $e');
      setState(() {
        _errorMessage = 'Gagal memuat data permohonan';
        _permohonanData = null;
      });
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(
                                'Permohonan',
                                style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Button Buat Permohonan
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 180,
                      height: 35,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormulirPermohonan()),
                          );
                        },
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 5),
                            Text(
                              'Buat Permohonan',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),

                // Content Area
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _errorMessage.isNotEmpty
                        ? Center(
                            child: Text(
                              _errorMessage,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(horizontal: 10),
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
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _permohonanData!.length,
                                    itemBuilder: (context, index) {
                                      final data = _permohonanData![index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              data['jenisPermohonan'] ??
                                                  'Loading...',
                                              style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'No. ${data['nomorSuratPermohonan'] ?? 'Loading...'}',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  data['tanggalDiajukan'] ??
                                                      'Loading...',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text(
                                                data['namaStatus'] ??
                                                    'Loading...',
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                        ],
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'Tidak ada data permohonan',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
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
}
