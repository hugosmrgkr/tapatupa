import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/user/login.dart';
import 'package:tapatupa/user/service/api_service.dart';

class FormScreen extends StatefulWidget {
  final String idObjekRetribusi;

  FormScreen({required this.idObjekRetribusi});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Map<String, dynamic> data = {};
  bool _isLoading = true;
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

      if (!isLoggedIn || token == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
        return;
      }

      await loadRetributionData(widget.idObjekRetribusi);
    } catch (e) {
      setState(() => _errorMessage = 'Authentication error: $e');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  Future<void> loadRetributionData(String id) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response =
          await ApiService.get('objek-retribusi-mobile/detail/$id');

      if (response['status'] == 200) {
        setState(() {
          data = response['objekRetribusi'] ?? {};
          // Remove unwanted keys
          data.remove('idObjekRetribusi');
          data.remove('idLokasiObjekRetribusi');
          data.remove('idJenisObjekRetribusi');
          data.remove('prov_id');
          data.remove('city_id');
          data.remove('dis_id');
          data.remove('subdis_id');
        });
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString());
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Here's the missing _buildTextData method
  Widget _buildTextData(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3, // Atur flex agar label tidak terlalu lebar
            child: Text(
              label,
              style: GoogleFonts.roboto(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          SizedBox(width: 10), // Tambah jarak agar lebih rapi
          Expanded(
            flex: 5, // Pastikan value memiliki ruang lebih besar
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.roboto(fontSize: 15.0, color: Colors.black87),
              softWrap: true, // Memastikan teks turun ke bawah jika panjang
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  top: MediaQuery.of(context).padding.top,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        // Tombol Back
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        // Judul
                        Center(
                          child: Text(
                            '          Detail Objek Retribusi',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : _errorMessage.isNotEmpty
                              ? Center(child: Text(_errorMessage))
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _buildDetailItem('Lokasi Objek Retribusi',
                                          data['lokasiObjekRetribusi']),
                                      _buildDetailItem('Jenis Objek Retribusi',
                                          data['jenisObjekRetribusi']),
                                      _buildDetailItem('Kode Objek Retribusi',
                                          data['kodeObjekRetribusi']),
                                      _buildDetailItem('NPWRD',
                                          data['npwrd']?.toString() ?? '0.00'),
                                      _buildDetailItem('Objek Retribusi',
                                          data['objekRetribusi']),
                                      _buildDetailItem('Panjang Tanah',
                                          data['panjangTanah']),
                                      _buildDetailItem(
                                          'Lebar Tanah', data['lebarTanah']),
                                      _buildDetailItem(
                                          'Luas Tanah', data['luasTanah']),
                                      _buildDetailItem(
                                          'Panjang Bangunan',
                                          data['panjangBangunan']?.toString() ??
                                              '0.00'),
                                      _buildDetailItem(
                                          'Lebar Bangunan',
                                          data['lebarBangunan']?.toString() ??
                                              '0.00'),
                                      _buildDetailItem(
                                          'Luas Bangunan',
                                          data['luasBangunan']?.toString() ??
                                              '0.00'),
                                      _buildDetailItem('Alamat',
                                          data['alamat']?.toString() ?? '-'),
                                      _buildDetailItem(
                                          'Alamat Lengkap',
                                          data['alamatLengkap']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Latitude',
                                          data['latitude']?.toString() ??
                                              '0.00'),
                                      _buildDetailItem('Longitude',
                                          data['longitude']?.toString() ?? '-'),
                                      _buildDetailItem(
                                          'Keterangan',
                                          data['keterangan']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Gambar Denah Tanah',
                                          data['gambarDenahTanah']
                                                  ?.toString() ??
                                              '-'),
                                      _buildDetailItem('Nama File',
                                          data['fileName']?.toString() ?? '-'),
                                      _buildDetailItem(
                                          'No Bangunan',
                                          data['noBangunan']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Jumlah Lantai',
                                          data['jumlahLantai']?.toString() ??
                                              '-'),
                                      _buildDetailItem('Kapasitas',
                                          data['kapasitas']?.toString() ?? '-'),
                                      _buildDetailItem(
                                          'Batas Utara',
                                          data['batasUtara']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Batas Selatan',
                                          data['batasSelatan']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Batas Timur',
                                          data['batasTimur']?.toString() ??
                                              '-'),
                                      _buildDetailItem(
                                          'Batas Barat',
                                          data['batasBarat']?.toString() ??
                                              '-'),
                                    ],
                                  ),
                                ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailItem(String label, dynamic value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 15,
          color: Colors.grey[600],
        ),
      ),
      SizedBox(height: 4),
      Text(
        value?.toString() ?? '-',
        style: GoogleFonts.roboto(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
      Divider(color: Colors.grey[200]),
      SizedBox(height: 8),
    ],
  );
}
