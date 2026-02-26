import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/detail-perjanjian.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/user/service/api_service.dart';

class perjanjian extends StatefulWidget {
  @override
  _PerjanjianState createState() => _PerjanjianState();
}

class _PerjanjianState extends State<perjanjian> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.red.withOpacity(0.7),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic>? _permohonanData;
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkAuthAndLoadData();
  }

  Future<void> _checkAuthAndLoadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final token = prefs.getString('accessToken');
      final idPersonal = prefs.getInt('idPersonal');

      if (!isLoggedIn || token == null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login');
        }
        return;
      }

      if (idPersonal != null) {
        await _fetchPermohonanData(idPersonal.toString());
      } else {
        throw Exception('No idPersonal found');
      }
    } catch (e) {
      setState(() => _errorMessage = 'Authentication error: $e');
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> _fetchPermohonanData(String idPersonal) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await ApiService.get('perjanjian-mobile/$idPersonal');

      if (response['status'] == 200) {
        setState(() {
          _permohonanData = response['perjanjianSewa'];
        });
      } else {
        throw Exception(response['message'] ?? 'Failed to load data');
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString());
      if (e.toString().contains('Unauthorized')) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else if (_errorMessage.isNotEmpty)
          Center(child: Text(_errorMessage))
        else
          SingleChildScrollView(
            child: Column(
              children: [
                // Header dengan pattern
                Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        height: screenHeight / 19 +
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
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Perjanjian',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
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
                // Content
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _permohonanData?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = _permohonanData?[index];
                      return GestureDetector(
                        onTap: () {
                          if (data != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailPerjanjian(
                                  id: data['idPerjanjianSewa'],
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.grey.withOpacity(0.9),
                          margin: EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'No. Surat ${data?['nomorSuratPerjanjian'] ?? 'Loading...'}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: data?['namaStatus'] == 'Lunas'
                                            ? Colors.orange
                                            : Colors.green,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        data?['namaStatus'] ?? 'Loading...',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.description,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tanggal Disahkan',
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            data?['tanggalDisahkan'] ??
                                                'Loading...',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Tanggal Berlaku',
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '${data?['tanggalAwalBerlaku'] ?? 'Loading...'} s/d ${data?['tanggalAkhirBerlaku'] ?? 'Loading...'}',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Objek Retribusi',
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '${data?['kodeObjekRetribusi'] ?? 'Loading...'} - ${data?['objekRetribusi'] ?? 'Loading...'}',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
