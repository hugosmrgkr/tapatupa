import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapatupa/user/detail-sewa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service/api_service.dart';

class TagihanBaru extends StatefulWidget {
  @override
  _TagihanBaruState createState() => _TagihanBaruState();
}

class _TagihanBaruState extends State<TagihanBaru> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic>? _permohonanData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTagihanData();
  }

  Future<void> _loadTagihanData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final idPersonal = prefs.getInt('idPersonal');
      final token = prefs.getString('accessToken');

      if (idPersonal == null || token == null) {
        throw Exception('User data not found');
      }

      final response = await ApiService.get('tagihan-mobile/$idPersonal');

      setState(() {
        _permohonanData = response['tagihanSewa'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  // Fetch permohonan data based on idPersonal
  Future<void> _fetchPermohonanData(String idPersonal) async {
    try {
      final response = await http.get(Uri.parse(
          'https://tapatupa.taputkab.go.id/api/tagihan-mobile/$idPersonal'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          // Check if the widget is still in the widget tree
          setState(() {
            _permohonanData = data['tagihanSewa'];
          });
        }
      } else {
        print('Failed to fetch permohonan data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching permohonan data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
// Format nilai menjadi Rupiah
    String formatRupiah(num? value) {
      if (value == null) return 'Loading...';
      final formatter =
          NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
      return formatter.format(value);
    }

    return Stack(
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
                          Colors.black.withOpacity(0.5), // Menambahkan opacity
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
                    top: screenHeight /
                        20, // Menyesuaikan posisi ke tengah lebih baik
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Tagihan Sewa',
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (_permohonanData != null &&
                                        _permohonanData!.isNotEmpty) {
                                      final int id = _permohonanData![0][
                                          'idPerjanjianSewa']; // Pastikan key 'id' sesuai dengan API
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              detailPerjanjianSewa(id: id),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.8),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap:
                                          true, // Menyusut berdasarkan konten
                                      physics:
                                          NeverScrollableScrollPhysics(), // Non-scroll jika shrinkWrap digunakan
                                      itemCount: _permohonanData?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final data = _permohonanData?[index];
                                        return Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blue
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Icon(
                                                          Icons.credit_card,
                                                          size: 32,
                                                          color: Colors.blue,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: 20),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'No. ${data?['nomorSuratPerjanjian'] ?? 'Loading...'}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Objek Retribusi: \n${data?['kodeObjekRetribusi'] ?? 'Loading...'} - ${data?['objekRetribusi'] ?? 'Loading...'}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Pembayaran: \n${formatRupiah(data?['jumlahPembayaran'] as num?)}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 4),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
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
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Divider(
                                                  color: Colors.grey[400],
                                                  thickness: 1),
                                            ],
                                          ),
                                        );
                                      },
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
            ],
          ),
        ),
      ],
    );
  }
}
