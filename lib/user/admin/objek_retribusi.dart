import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class objek_retribusi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ObjekRetribusiAdminPage();
  }
}

class ObjekRetribusiAdminPage extends StatelessWidget {
  final List<Map<String, dynamic>> _objekList = [
    {
      'id': 'OBJ-2024-001',
      'nama': 'Ruang Kantor Lantai 1',
      'lokasi': 'Jl. Merdeka No. 45',
      'ukuran': '500 m²',
      'kapasitas': '50 orang',
      'status': 'Tersedia',
      'statusColor': Colors.green,
      'fasilitas': ['AC', 'WiFi', 'Parkir', 'Lift'],
      'hargaPerHari': 500000,
    },
    {
      'id': 'OBJ-2024-002',
      'nama': 'Ruang Meeting Lantai 2',
      'lokasi': 'Jl. Merdeka No. 45',
      'ukuran': '150 m²',
      'kapasitas': '30 orang',
      'status': 'Tersedia',
      'statusColor': Colors.green,
      'fasilitas': ['AC', 'Proyektor', 'WiFi'],
      'hargaPerHari': 300000,
    },
    {
      'id': 'OBJ-2024-003',
      'nama': 'Ruang Workshop',
      'lokasi': 'Jl. Merdeka No. 50',
      'ukuran': '300 m²',
      'kapasitas': '40 orang',
      'status': 'Disewa',
      'statusColor': Colors.orange,
      'fasilitas': ['AC', 'Meja', 'Kursi'],
      'hargaPerHari': 400000,
    },
    {
      'id': 'OBJ-2024-004',
      'nama': 'Ruang Penyimpanan',
      'lokasi': 'Basement',
      'ukuran': '200 m²',
      'kapasitas': '100 unit',
      'status': 'Tersedia',
      'statusColor': Colors.green,
      'fasilitas': ['Keamanan 24 jam', 'Ventilasi', 'Pencahayaan'],
      'hargaPerHari': 200000,
    },
    {
      'id': 'OBJ-2024-005',
      'nama': 'Ruang Resepsi',
      'lokasi': 'Lantai Dasar',
      'ukuran': '75 m²',
      'kapasitas': '20 orang',
      'status': 'Disewa',
      'statusColor': Colors.orange,
      'fasilitas': ['AC', 'WiFi', 'Meja', 'Telepon'],
      'hargaPerHari': 250000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.14,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDC3545), Color(0xFF8B0000)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.store, size: 36, color: Colors.white.withOpacity(0.9)),
                      SizedBox(height: 10),
                      Text(
                        'OBJEK RETRIBUSI',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Manajemen aset dan objek retribusi',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manajemen Objek',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Menambah objek baru...'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: Icon(Icons.add),
                          label: Text('Tambah'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDC3545),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _objekList.length,
                      itemBuilder: (context, index) {
                        final objek = _objekList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.08),
                                blurRadius: 12,
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.05),
                              width: 1,
                            ),
                          ),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            objek['nama'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            objek['lokasi'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: objek['statusColor'],
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        objek['status'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildInfoChip('Ukuran', objek['ukuran']),
                                    _buildInfoChip(
                                        'Kapasitas', objek['kapasitas']),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Fasilitas:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    for (final fasilitas
                                        in objek['fasilitas'])
                                      Chip(
                                        label: Text(
                                          fasilitas,
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                          ),
                                        ),
                                        backgroundColor:
                                            Colors.grey[200],
                                      ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Edit ${objek['nama']}...'),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color(0xFFDC3545),
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        'Edit',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertDialog(
                                            title: Text('Hapus Objek'),
                                            content: Text(
                                              'Yakin ingin menghapus ${objek['nama']}?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text('Batal'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(
                                                          context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Objek dihapus'),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton
                                                    .styleFrom(
                                                  backgroundColor:
                                                      Colors.red,
                                                ),
                                                child: Text('Hapus'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text('Hapus',
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFFDC3545),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: 6),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
