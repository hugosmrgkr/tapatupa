import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'service/api_service.dart';
import 'service/s3_helper.dart';

class detailPerjanjian extends StatefulWidget {
  final int id;

  detailPerjanjian({required this.id});

  @override
  _DetailPerjanjianState createState() => _DetailPerjanjianState();
}

class _DetailPerjanjianState extends State<detailPerjanjian> {
  Map<String, dynamic>? _detailPerjanjianSewa;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDetailPerjanjianData();
  }

  Future<void> _fetchDetailPerjanjianData() async {
    try {
      setState(() => _isLoading = true);

      final response =
          await ApiService.get('perjanjian-mobile/detail/${widget.id}');

      if (response['status'] == 200) {
        setState(() {
          _detailPerjanjianSewa = response['perjanjianSewa'];
          _isLoading = false;
        });
      } else {
        throw Exception(response['message'] ?? 'Failed to load data');
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
    final nomorSuratPerjanjian =
        _detailPerjanjianSewa?['nomorSuratPerjanjian']?.toString() ?? '';
    final docUrl = nomorSuratPerjanjian.isNotEmpty
        ? S3Helper.getPerjanjianDocumentUrl(nomorSuratPerjanjian)
        : null;
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
                onPressed: _fetchDetailPerjanjianData,
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
                              'Detail Perjanjian Sewa',
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
                      _buildDetailItem(
                          'Nomor Surat Permohonan',
                          _detailPerjanjianSewa?['nomorSuratPermohonan']
                              ?.toString()),
                      _buildDetailItem(
                          'Tanggal Permohonan',
                          _detailPerjanjianSewa?['tanggalPermohonan']
                              ?.toString()),
                      _buildDetailItem(
                          'NPWRD', _detailPerjanjianSewa?['npwrd']?.toString()),
                      _buildDetailItem(
                          'Kode Objek Retribusi',
                          _detailPerjanjianSewa?['kodeObjekRetribusi']
                              ?.toString()),
                      _buildDetailItem(
                          'NIK Wajib Retribusi',
                          _detailPerjanjianSewa?['nikWajibRetribusi']
                              ?.toString()),
                      _buildDetailItem(
                          'Nama Objek Retribusi',
                          _detailPerjanjianSewa?['namaObjekRetribusi']
                              ?.toString()),
                      _buildDetailItem(
                          'Nomor Surat Perjanjian',
                          _detailPerjanjianSewa?['nomorSuratPerjanjian']
                              ?.toString()),
                      _buildDetailItem('Lama Sewa',
                          _detailPerjanjianSewa?['lamaSewa']?.toString()),
                      _buildDetailItem('Disahkan Oleh',
                          _detailPerjanjianSewa?['disahkanOleh']?.toString()),
                      _buildDetailItem('Keterangan',
                          _detailPerjanjianSewa?['keterangan']?.toString()),
                      _buildDetailItem(
                          'Tanggal Disahkan',
                          _detailPerjanjianSewa?['tanggalDisahkan']
                              ?.toString()),
                      _buildDetailItem(
                          'Tanggal Awal Perjanjian',
                          _detailPerjanjianSewa?['tanggalAwalPerjanjian']
                              ?.toString()),
                      _buildDetailItem(
                          'Tanggal Akhir Perjanjian',
                          _detailPerjanjianSewa?['tanggalAkhirPerjanjian']
                              ?.toString()),
                      _buildDetailItem('Jabatan Pengelola',
                          _detailPerjanjianSewa?['jabatan']?.toString()),
                      _buildDetailItem(
                          'Status Perjanjian',
                          _detailPerjanjianSewa?['statusPerjanjian']
                              ?.toString()),
                      _buildDetailItem('Peruntukan Sewa',
                          _detailPerjanjianSewa?['peruntukanSewa']?.toString()),
                      // _buildDetailItem(
                      //     'File Surat Perjanjian',
                      //     _detailPerjanjianSewa?['fileSuratPerjanjian']
                      //         ?.toString()),
                      if (docUrl != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'File Surat Perjanjian',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              InkWell(
                                onTap: () async {
                                  // Membuka dokumen di browser atau PDF viewer
                                  // Gunakan url_launcher jika ingin membuka di browser
                                  // Pastikan sudah menambahkan package url_launcher di pubspec.yaml
                                  // import 'package:url_launcher/url_launcher.dart';
                                  if (await canLaunch(docUrl)) {
                                    await launch(docUrl);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.picture_as_pdf,
                                        color: Colors.red),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        docUrl.split('/').last,
                                        style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Divider(color: Colors.grey[200]),
                            ],
                          ),
                        ),
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

  Widget _buildDetailItem(String label, String? value) {
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
            value ?? 'Tidak tersedia',
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
