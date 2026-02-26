import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'service/api_service.dart';
import 'service/s3_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTarif extends StatefulWidget {
  final String idObjekRetribusi;

  DetailTarif({required this.idObjekRetribusi});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<DetailTarif> {
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
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login()),
          );
        }
        return;
      }

      await loadRetributionData(widget.idObjekRetribusi);
    } catch (e) {
      setState(() => _errorMessage = 'Authentication error: $e');
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      }
    }
  }

  Future<void> loadRetributionData(String id) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response =
          await ApiService.get('objek-retribusi-mobile/detail-tarif/$id');

      if (response['status'] == 200) {
        final filteredData =
            Map<String, dynamic>.from(response['tarifObjekRetribusi']);

        // Remove unwanted keys
        final keysToRemove = [
          'idTarifObjekRetribusi',
          'idObjekRetribusi',
          'idLokasiObjekRetribusi',
          'idJenisObjekRetribusi',
          'subdis_id',
          'fileName',
          'idJenisJangkawaktu'
        ];
        keysToRemove.forEach(filteredData.remove);

        setState(() {
          data = filteredData;
        });
      } else {
        throw Exception(response['message'] ?? 'Failed to load data');
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString());
      if (e.toString().contains('Unauthorized')) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login()),
          );
        }
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final kodeObjekRetribusi = data['kodeObjekRetribusi']?.toString() ?? '';
    final docUrl = kodeObjekRetribusi.isNotEmpty
        ? S3Helper.getTarifObjekRetribusiDocumentUrl(kodeObjekRetribusi)
        : null;
    return Scaffold(
      body: Stack(
        children: [
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_errorMessage.isNotEmpty)
            Center(child: Text(_errorMessage))
          else
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        top: 42,
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
                                  '             Detail Tarif Sewa',
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
                    padding: const EdgeInsets.all(16.0),
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
                                            _buildDetailItem(
                                                'Nomor Surat Perjanjian',
                                                data['nomorSuratPerjanjian']),
                                            _buildDetailItem('Tanggal Disahkan',
                                                data['tanggalDisahkan']),
                                            _buildDetailItem(
                                                'Nama Wajib Retribusi',
                                                data['namaWajibRetribusi']),
                                            _buildDetailItem(
                                                'Alamat Wajib Retribusi',
                                                data['alamatWajibRetribusi']),
                                            _buildDetailItem(
                                                'Kode Objek Retribusi',
                                                data['kodeObjekRetribusi']),
                                            _buildDetailItem('Objek Retribusi',
                                                data['objekRetribusi']),
                                            _buildDetailItem(
                                                'Jenis Jangka Waktu',
                                                data['jenisJangkaWaktu']),
                                            _buildDetailItem('Nama Satuan',
                                                data['namaSatuan']),
                                            _buildDetailItem(
                                                'Panjang Tanah',
                                                data['panjangTanah']
                                                        ?.toString() ??
                                                    '0.00'),
                                            _buildDetailItem(
                                                'Lebar Tanah',
                                                data['lebarTanah']
                                                        ?.toString() ??
                                                    '0.00'),
                                            _buildDetailItem(
                                                'Luas Tanah',
                                                data['luasTanah']?.toString() ??
                                                    '0.00'),
                                            _buildDetailItem(
                                                'Panjang Bangunan',
                                                data['panjangBangunan']
                                                        ?.toString() ??
                                                    '0.00'),
                                            _buildDetailItem(
                                                'Lebar Bangunan',
                                                data['lebarBangunan']
                                                        ?.toString() ??
                                                    '0.00'),
                                            _buildDetailItem(
                                                'Luas Bangunan',
                                                data['luasBangunan']
                                                        ?.toString() ??
                                                    '0.00'),
                                            if (docUrl != null)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'File Tarif Objek Retribusi',
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    InkWell(
                                                      onTap: () async {
                                                        // Membuka dokumen di browser atau PDF viewer
                                                        // Gunakan url_launcher jika ingin membuka di browser
                                                        // Pastikan sudah menambahkan package url_launcher di pubspec.yaml
                                                        // import 'package:url_launcher/url_launcher.dart';
                                                        if (await canLaunch(
                                                            docUrl)) {
                                                          await launch(docUrl);
                                                        }
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .picture_as_pdf,
                                                              color:
                                                                  Colors.red),
                                                          SizedBox(width: 8),
                                                          Expanded(
                                                            child: Text(
                                                              docUrl
                                                                  .split('/')
                                                                  .last,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Divider(
                                                        color:
                                                            Colors.grey[200]),
                                                  ],
                                                ),
                                              ),
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
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value?.toString() ?? '-',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey[200]),
        ],
      ),
    );
  }
}
