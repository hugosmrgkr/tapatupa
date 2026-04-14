import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapatupa/user/service/api_service.dart';

/// UC-04: Lihat Aset Retribusi
/// Masyarakat dapat melihat daftar aset retribusi, melakukan pencarian dan filter,
/// serta melihat detail aset termasuk foto, deskripsi, fasilitas, kapasitas
class AssetRetribusiPage extends StatefulWidget {
  @override
  _AssetRetribusiPageState createState() => _AssetRetribusiPageState();
}

class _AssetRetribusiPageState extends State<AssetRetribusiPage> {
  final TextEditingController _searchController = TextEditingController();
  
  List<dynamic> _assets = [];
  bool _isLoading = false;
  String _selectedStatus = 'ALL';
  String _selectedLocation = 'ALL';
  String _errorMessage = '';
  
  final List<String> _statusOptions = ['ALL', 'AVAILABLE', 'UNAVAILABLE', 'MAINTENANCE'];

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Call API to get assets list
      final response = await ApiService.get('assets/api/v1/assets', queryParams: {
        'search': _searchController.text,
        'status': _selectedStatus == 'ALL' ? '' : _selectedStatus,
        'location': _selectedLocation == 'ALL' ? '' : _selectedLocation,
        'limit': '50',
        'offset': '0',
      });

      if (mounted) {
        setState(() {
          _assets = response['data'] ?? _getDummyAssets();
          _isLoading = false;
        });
      }
    } catch (e) {
      // Fallback ke dummy data jika API gagal
      if (mounted) {
        setState(() {
          _assets = _getDummyAssets();
          _isLoading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> _getDummyAssets() {
    List<Map<String, dynamic>> allAssets = [
      {
        'code': '120215001',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '1000 m²',
        'status': 'AVAILABLE',
        'description': 'Lahan kosong siap sewa untuk usaha retail, pertanian, atau penggunaan lainnya.',
      },
      {
        'code': '120215002',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '800 m²',
        'status': 'AVAILABLE',
        'description': 'Lokasi strategis dekat dengan pusat kota untuk bisnis komersial.',
      },
      {
        'code': '120215003',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '1200 m²',
        'status': 'UNAVAILABLE',
        'description': 'Area tegak lurus dengan rel kereta api.',
      },
      {
        'code': '120215004',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '500 m²',
        'status': 'AVAILABLE',
        'description': 'Lahan kecil cocok untuk usaha kecil atau kantor cabang.',
      },
      {
        'code': '120215005',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '1500 m²',
        'status': 'AVAILABLE',
        'description': 'Lahan besar dengan fasilitas lengkap.',
      },
      {
        'code': '120215006',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '600 m²',
        'status': 'MAINTENANCE',
        'description': 'Dalam tahap perbaikan, akan segera tersedia.',
      },
      {
        'code': '120215007',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '900 m²',
        'status': 'AVAILABLE',
        'description': 'Area dengan pemandangan bagus dan dekat dengan fasilitas umum.',
      },
      {
        'code': '120215008',
        'name': 'Sewa Tanah',
        'category': 'Lahan',
        'location': 'Kecamatan Muara',
        'capacity': '700 m²',
        'status': 'AVAILABLE',
        'description': 'Lokasi premium di kawasan bisnis utama.',
      },
    ];

    // Filter berdasarkan search dan status
    var filtered = allAssets.where((asset) {
      bool matchSearch = _searchController.text.isEmpty ||
          asset['name'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
          asset['code'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
          asset['location'].toLowerCase().contains(_searchController.text.toLowerCase());

      bool matchStatus = _selectedStatus == 'ALL' || asset['status'] == _selectedStatus;

      bool matchLocation = _selectedLocation == 'ALL' || asset['location'].contains(_selectedLocation);

      return matchSearch && matchStatus && matchLocation;
    }).toList();

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          // Premium Header dengan gradient
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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      right: -50,
                      top: -50,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aset Retribusi',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Jelajahi daftar aset yang tersedia',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Search dan Filter Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search Box
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari aset...',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.grey[500]),
                              onPressed: () {
                                _searchController.clear();
                                _loadAssets();
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onChanged: (_) {
                      setState(() {});
                      _loadAssets();
                    },
                  ),
                  SizedBox(height: 12),

                  // Filter Row
                  Row(
                    children: [
                      Expanded(
                        child: _FilterChip(
                          label: 'Status: ${_selectedStatus == 'ALL' ? 'Semua' : _selectedStatus}',
                          options: _statusOptions,
                          onChanged: (value) {
                            setState(() => _selectedStatus = value);
                            _loadAssets();
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _FilterChip(
                          label: 'Lokasi',
                          options: ['ALL', 'LOKASI_A', 'LOKASI_B'],
                          onChanged: (value) {
                            setState(() => _selectedLocation = value);
                            _loadAssets();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Assets List
          if (_errorMessage.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _errorMessage,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ),
            )
          else if (_isLoading)
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
          else if (_assets.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Tidak ada aset tersedia',
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
                  (context, index) => _AssetCard(
                    asset: _assets[index],
                    onTap: () => _showAssetDetail(context, _assets[index]),
                  ),
                  childCount: _assets.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showAssetDetail(BuildContext context, dynamic asset) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AssetDetailModal(asset: asset),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

/// Kartu untuk setiap aset dalam list
class _AssetCard extends StatelessWidget {
  final dynamic asset;
  final VoidCallback onTap;

  const _AssetCard({
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Row(
            children: [
              // Asset Photo/Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  color: Colors.grey.shade200,
              ),
                child: Icon(
                  Icons.home_work_outlined,
                  size: 40,
                  color: Colors.grey.shade400,
                ),
              ),
              // Asset Info
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        asset['name'] ?? 'Aset Tanpa Nama',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        asset['code'] ?? '-',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 6),
                      _StatusBadge(status: asset['status'] ?? 'UNKNOWN'),
                    ],
                  ),
                ),
              ),
              // Arrow
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Status badge dengan warna berbeda sesuai status
class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  Color _getStatusColor() {
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
        return Colors.green;
      case 'UNAVAILABLE':
        return Colors.orange;
      case 'MAINTENANCE':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        border: Border.all(color: _getStatusColor().withOpacity(0.3)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: _getStatusColor(),
        ),
      ),
    );
  }
}

/// Modal untuk detail aset
class _AssetDetailModal extends StatelessWidget {
  final dynamic asset;

  const _AssetDetailModal({required this.asset});

  @override
  Widget build(BuildContext context) {
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
          // Detail content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                asset['name'] ?? 'Aset Tanpa Nama',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                asset['code'] ?? '-',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        _StatusBadge(status: asset['status'] ?? 'UNKNOWN'),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Description
                    if (asset['description'] != null) ...[
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
                        asset['description'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],

                    // Key Information
                    Text(
                      'Informasi Utama',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    _InfoRow(label: 'Kategori', value: asset['category'] ?? '-'),
                    _InfoRow(label: 'Lokasi', value: asset['location'] ?? '-'),
                    _InfoRow(label: 'Kapasitas', value: asset['capacity'] ?? '-'),
                    SizedBox(height: 20),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.visibility_outlined),
                            label: Text('Lihat Tarif'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Color(0xFFDC3545),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // TODO: Navigate to tarif dengan aset ini dipilih
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.add_outlined),
                            label: Text('Buat Permohonan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDC3545),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // TODO: Navigate to permohonan form dengan aset ini dipilih
                            },
                          ),
                        ),
                      ],
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

/// Row untuk menampilkan informasi key-value
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

/// Filter chip untuk dropdown filter
class _FilterChip extends StatefulWidget {
  final String label;
  final List<String> options;
  final Function(String) onChanged;

  const _FilterChip({
    required this.label,
    required this.options,
    required this.onChanged,
  });

  @override
  _FilterChipState createState() => _FilterChipState();
}

class _FilterChipState extends State<_FilterChip> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            child: ListView(
              children: widget.options.map((option) {
                return ListTile(
                  title: Text(option),
                  selected: option == _selectedValue,
                  onTap: () {
                    setState(() => _selectedValue = option);
                    widget.onChanged(option);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Icon(Icons.arrow_drop_down, size: 18, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}
