import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service/api_service.dart';

class DetailPermohonan extends StatefulWidget {
  final String? idPermohonanSewa;
  final String? kodeObjekRetribusi;

  DetailPermohonan({this.idPermohonanSewa, this.kodeObjekRetribusi});

  @override
  _DetailPermohonanState createState() => _DetailPermohonanState();
}

class _DetailPermohonanState extends State<DetailPermohonan> {
  Map<String, dynamic>? _detailPermohonan;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDetailPermohonan();
  }

  Future<void> _fetchDetailPermohonan() async {
    try {
      setState(() => _isLoading = true);

      print('idPermohonan: ${widget.idPermohonanSewa}');
      print('kodeObjekRetribusi: ${widget.kodeObjekRetribusi}');

      Map<String, dynamic> response;
      if (widget.idPermohonanSewa != null &&
          widget.idPermohonanSewa!.isNotEmpty) {
        response = await ApiService.get(
            'permohonan-mobile/detail/${widget.idPermohonanSewa}');
      } else if (widget.kodeObjekRetribusi != null &&
          widget.kodeObjekRetribusi!.isNotEmpty) {
        response = await ApiService.get(
            'permohonan-mobile/detail-by-kode/${widget.kodeObjekRetribusi}');
      } else {
        throw Exception('Parameter tidak valid');
      }

      print('API Response: $response');

      if (response['status'] == 200) {
        setState(() {
          _detailPermohonan = response['detailDermohonan'];
          _isLoading = false;
        });
      } else {
        throw Exception(response['responseMessage'] ?? 'Gagal memuat data');
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });

      if (e.toString().contains('Unauthorized') ||
          e.toString().contains('401')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.red),
              SizedBox(height: 16),
              Text(_error!, style: TextStyle(fontSize: 16)),
              ElevatedButton(
                onPressed: _fetchDetailPermohonan,
                child: Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    height:
                        screenHeight / 19 + MediaQuery.of(context).padding.top,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/gorgabatak.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 41,
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
                              'Detail Permohonan',
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
                      _buildDetailItem('Kode Objek Retribusi',
                          _detailPermohonan?['kodeObjekRetribusi']),
                      _buildDetailItem('Nama Objek Retribusi',
                          _detailPermohonan?['namaObjekRetribusi']),
                      _buildDetailItem('Nama Wajib Retribusi',
                          _detailPermohonan?['namaWajibRetribusi']),
                      _buildDetailItem('NIK', _detailPermohonan?['nik']),
                      _buildDetailItem('File Dokumen Kelengkapan',
                          _detailPermohonan?['fileDokumenKelengkapan']),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value?.toString() ?? 'Tidak tersedia',
            style: GoogleFonts.roboto(
              fontSize: 16,
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
