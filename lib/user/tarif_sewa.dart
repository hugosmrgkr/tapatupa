import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/service/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// UC-05: Lihat Tarif Sewa
/// Masyarakat dapat melihat daftar tarif sewa dengan detail lengkap,
/// perbandingan harga, dan dokumen tarif jika tersedia
class TarifSewaPage extends StatefulWidget {
  @override
  _TarifSewaPageState createState() => _TarifSewaPageState();
}

class _TarifSewaPageState extends State<TarifSewaPage> {
  List<Map<String, dynamic>> _tarifs = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTarifs();
  }

  Future<void> _loadTarifs() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Try API first
      final response = await ApiService.get('tarif');
      if (mounted) {
        setState(() {
          _tarifs = (response['data'] ?? []).cast<Map<String, dynamic>>();
          _isLoading = false;
        });
      }
    } catch (e) {
      // Fallback ke dummy data
      if (mounted) {
        setState(() {
          _tarifs = _getDummyTarifs();
          _isLoading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> _getDummyTarifs() {
    return [
      {
        'id': 'TAR-001',
        'kategori': 'Lahan Kosong',
        'tiering': [
          {'tier': '0-500 m²', 'harga': 'Rp 50.000 / m² / bulan'},
          {'tier': '500-1000 m²', 'harga': 'Rp 45.000 / m² / bulan'},
          {'tier': '1000+ m²', 'harga': 'Rp 40.000 / m² / bulan'},
        ],
        'description': 'Tarif sewa untuk lahan kosong dengan berbagai ukuran',
        'dokumen': 'https://example.com/tarif-lahan.pdf',
      },
      {
        'id': 'TAR-002',
        'kategori': 'Gedung Perkantoran',
        'tiering': [
          {'tier': '0-100 m²', 'harga': 'Rp 100.000 / m² / bulan'},
          {'tier': '100-200 m²', 'harga': 'Rp 85.000 / m² / bulan'},
          {'tier': '200+ m²', 'harga': 'Rp 70.000 / m² / bulan'},
        ],
        'description': 'Tarif sewa untuk gedung perkantoran kelas A',
        'dokumen': 'https://example.com/tarif-gedung.pdf',
      },
      {
        'id': 'TAR-003',
        'kategori': 'Toko Komersial',
        'tiering': [
          {'tier': '0-50 m²', 'harga': 'Rp 150.000 / m² / bulan'},
          {'tier': '50-100 m²', 'harga': 'Rp 130.000 / m² / bulan'},
          {'tier': '100+ m²', 'harga': 'Rp 110.000 / m² / bulan'},
        ],
        'description': 'Tarif sewa untuk toko komersial di pusat perbelanjaan',
        'dokumen': 'https://example.com/tarif-toko.pdf',
      },
      {
        'id': 'TAR-004',
        'kategori': 'Gudang Penyimpanan',
        'tiering': [
          {'tier': '0-1000 m²', 'harga': 'Rp 30.000 / m² / bulan'},
          {'tier': '1000-2000 m²', 'harga': 'Rp 25.000 / m² / bulan'},
          {'tier': '2000+ m²', 'harga': 'Rp 20.000 / m² / bulan'},
        ],
        'description': 'Tarif sewa untuk gudang dengan sistem modern',
        'dokumen': 'https://example.com/tarif-gudang.pdf',
      },
      {
        'id': 'TAR-005',
        'kategori': 'Ruang Meeting',
        'tiering': [
          {'tier': '10-20 orang', 'harga': 'Rp 200.000 / jam'},
          {'tier': '20-50 orang', 'harga': 'Rp 350.000 / jam'},
          {'tier': '50+ orang', 'harga': 'Rp 500.000 / jam'},
        ],
        'description': 'Tarif sewa untuk ruang pertemuan dengan fasilitas lengkap',
        'dokumen': 'https://example.com/tarif-meeting.pdf',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          // Header dengan gradient
          SliverAppBar(
            expandedHeight: screenHeight * 0.14,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFFDC3545),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tarif Sewa',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Informasi harga sewa objek retribusi',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Tarif List
          if (_isLoading)
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDC3545)),
                  ),
                ),
              ),
            )
          else if (_tarifs.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Tidak ada tarif tersedia',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _TarifCard(
                    tarif: _tarifs[index],
                    onTap: () => _showTarifDetail(context, _tarifs[index]),
                  ),
                  childCount: _tarifs.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showTarifDetail(BuildContext context, Map<String, dynamic> tarif) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TarifDetailModal(tarif: tarif),
    );
  }
}

// Tarif Card
class _TarifCard extends StatelessWidget {
  final Map<String, dynamic> tarif;
  final VoidCallback onTap;

  const _TarifCard({
    required this.tarif,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tiering = tarif['tiering'] as List? ?? [];
    final hargaTerendah = tiering.isNotEmpty 
        ? tiering.first['harga'] ?? 'Rp 0'
        : 'Rp 0';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade100, width: 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tarif['kategori'] ?? 'Tarif Tanpa Nama',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          'ID: ${tarif['id'] ?? '-'}',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
                ],
              ),
              SizedBox(height: 12),

              // Pricing info
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFDC3545).withOpacity(0.05),
                  border: Border.all(color: Color(0xFFDC3545).withOpacity(0.15)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga Mulai:',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      hargaTerendah,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFDC3545),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Detail Modal
class _TarifDetailModal extends StatelessWidget {
  final Map<String, dynamic> tarif;

  const _TarifDetailModal({required this.tarif});

  @override
  Widget build(BuildContext context) {
    final tiering = tarif['tiering'] as List? ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tarif['kategori'] ?? 'Tarif',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'ID: ${tarif['id'] ?? '-'}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, size: 24, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Description
                    if (tarif['description'] != null && (tarif['description'] as String).isNotEmpty) ...[
                      Text(
                        'Deskripsi',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        tarif['description'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],

                    // Tier Pricing
                    Text(
                      'Skala Harga',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    ...tiering.asMap().entries.map((e) {
                      final index = e.key;
                      final item = e.value as Map<String, dynamic>;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.grey[50] : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFDC3545).withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['tier'] ?? '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                item['harga'] ?? '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFDC3545),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),

                    // Action button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Buat permohonan untuk ${tarif['kategori']}',
                                style: GoogleFonts.poppins(),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        icon: Icon(Icons.add),
                        label: Text(
                          'Buat Permohonan',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDC3545),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
