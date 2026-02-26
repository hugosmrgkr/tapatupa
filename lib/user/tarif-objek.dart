import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapatupa/user/detail-tarif.dart';
import 'login.dart';
import 'service/api_service.dart';

class TarifObjekListPage extends StatefulWidget {
  @override
  _TarifObjekListPageState createState() => _TarifObjekListPageState();
}

class _TarifObjekListPageState extends State<TarifObjekListPage> {
  List<Map<String, dynamic>> _originalData = [];
  List<Map<String, dynamic>> _filteredData = [];
  TextEditingController _searchController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _checkAuthAndFetchData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _filterData();
    });
  }

  void _filterData() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredData = _originalData;
      } else {
        _filteredData = _originalData.where((item) {
          final kodeObjek =
              item['kodeObjekRetribusi']?.toString().toLowerCase() ?? '';
          final objekRetribusi =
              item['objekRetribusi']?.toString().toLowerCase() ?? '';
          final nominalTarif =
              item['nominalTarif']?.toString().toLowerCase() ?? '';

          return kodeObjek.contains(query) ||
              objekRetribusi.contains(query) ||
              nominalTarif.contains(query);
        }).toList();
      }
    });
  }

  Future<void> _checkAuthAndFetchData() async {
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

      await fetchRetributionData();
    } catch (e) {
      print('Auth check error: $e');
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      }
    }
  }

  Future<void> fetchRetributionData() async {
    try {
      final response = await ApiService.get('objek-retribusi-mobile/tarif');

      if (response['status'] == 200) {
        setState(() {
          _originalData =
              List<Map<String, dynamic>>.from(response['tarifRetribusi']);
          _filteredData = _originalData;
        });
      } else {
        throw Exception(response['message'] ?? 'Failed to load data');
      }
    } catch (e) {
      if (e.toString().contains('Unauthorized')) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login()),
          );
        }
      }
      throw Exception('Failed to load retribution data: $e');
    }
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 224, 224),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[600]),
                    onPressed: () {
                      _searchController.clear();
                      _filterData();
                    },
                  )
                : null,
            hintText: "Cari kode atau nama objek retribusi...",
            hintStyle: GoogleFonts.roboto(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
          style: GoogleFonts.roboto(fontSize: 14),
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => _filterData(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
                top: screenHeight / 20,
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
                            ' Daftar Tarif Objek Retribusi \n di Kabupaten Tapanuli Utara',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
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
          _buildSearchField(),
          Expanded(
            child: _filteredData.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'Data tidak ditemukan',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    itemCount: _filteredData.length,
                    itemBuilder: (context, index) {
                      final data = _filteredData[index];
                      return _buildRetributionItem(context, data);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRetributionItem(
      BuildContext context, Map<String, dynamic> data) {
    String imagePath = 'assets/default.png'; // Default image

    // Determine image based on objek retribusi
    if (data['objekRetribusi']
        .toString()
        .toLowerCase()
        .contains('sewa tanah')) {
      imagePath = 'assets/tanah.jpg';
    } else if (data['objekRetribusi']
        .toString()
        .toLowerCase()
        .contains('sewa bangunan')) {
      imagePath = 'assets/bangunan.png';
    }
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(0.9),
      margin: EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left side - Image

            SizedBox(width: 16),
            // Right side - Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Code and Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['kodeObjekRetribusi'] ?? '-'} ${data['objekRetribusi'] ?? '-'}',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${data['nomorSuratPerjanjian'] ?? ''} ',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right side - Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rp ${NumberFormat("#,###").format(data['nominalTarif'])}',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailTarif(
                                    idObjekRetribusi:
                                        data['idTarifObjekRetribusi']
                                            .toString(),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: Text(
                              'Lihat Detail',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
