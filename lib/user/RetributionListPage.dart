import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_objek_retribusi.dart';
import 'service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetributionListPage extends StatefulWidget {
  final String? initialKecamatan;

  const RetributionListPage({Key? key, this.initialKecamatan})
      : super(key: key);

  @override
  _RetributionListPageState createState() => _RetributionListPageState();
}

class _RetributionListPageState extends State<RetributionListPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  List<Map<String, dynamic>> _currentPageData = [];
  String? _selectedKecamatan;
  bool _isLoading = false;
  String _errorMessage = '';

  String _getImageForObjekRetribusi(String objekRetribusi) {
    if (objekRetribusi.toLowerCase().contains('sewa tanah')) {
      return 'assets/tanah.jpg';
    } else if (objekRetribusi.toLowerCase().contains('sewa bangunan')) {
      return 'assets/bangunan.png';
    }
    // Add more conditions for other types if needed
    return 'assets/default.jpg'; // Default image
  }

  // Pagination variables
  final int _itemsPerPage = 50;
  int _currentPage = 1;
  int _totalItems = 0;
  int _totalPages = 1;

  final List<String> _fixedKecamatanList = [
    "Adian Koting",
    "Garoga",
    "Muara",
    "Pagaran",
    "Pahae Julu",
    "Pahae Jae",
    "Parmaksian",
    "Purbatua",
    "Siatas Barita",
    "Siborong-borong",
    "Sipahutar",
    "Simangumban",
    "Tarutung",
  ];

  @override
  void initState() {
    super.initState();
    _checkAuthAndFetchData();
    _searchController.addListener(_onSearchChanged);
    if (widget.initialKecamatan != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyFilter(widget.initialKecamatan!);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetchRetributionData();
    });
  }

  Future<void> _checkAuthAndFetchData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final token = prefs.getString('accessToken');

      if (!isLoggedIn || token == null) {
        Navigator.pushReplacementNamed(context, '/login');
        return;
      }

      await _fetchRetributionData();
    } catch (e) {
      print('Auth check error: $e');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> _fetchRetributionData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      Map<String, String> queryParams = {
        'page': _currentPage.toString(),
        'limit': '50', // Set fixed limit to 50 items per page
      };

      if (_searchController.text.isNotEmpty) {
        queryParams['search'] = _searchController.text;
      }

      if (_selectedKecamatan != null) {
        queryParams['kecamatan'] = _selectedKecamatan!;
      }

      final response = await ApiService.get(
        'objek-retribusi-mobile',
        queryParams: queryParams,
      );

      if (response['status'] == 200) {
        final List<dynamic> rawData = response['objekRetribusi'] ?? [];
        _totalItems = response['total'] ?? 0; // Total items from API
        _totalPages = (_totalItems / 50).ceil(); // Calculate total pages

        setState(() {
          _currentPageData = List<Map<String, dynamic>>.from(rawData);
          if (_currentPage > _totalPages && _totalPages > 0) {
            // If current page is beyond total pages, go to last page
            _currentPage = _totalPages;
            _fetchRetributionData();
          }
        });
      }
    } catch (e) {
      setState(() => _errorMessage = 'Gagal memuat data: ${e.toString()}');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _applyFilter(String kecamatan) {
    setState(() {
      _selectedKecamatan = kecamatan;
      _currentPage = 1;
    });
    _fetchRetributionData();
  }

  void _resetFilter() {
    setState(() {
      _selectedKecamatan = null;
      _searchController.clear();
      _currentPage = 1;
    });
    _fetchRetributionData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // Header section
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
                    child:
                        Image.asset('assets/gorgabatak.jpg', fit: BoxFit.cover),
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
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '     Daftar Objek Retribusi \ndi Kabupaten Tapanuli Utara',
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

          // Search and filter section
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 224, 224),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear, color: Colors.grey),
                                onPressed: () {
                                  _searchController.clear();
                                  _fetchRetributionData();
                                },
                              )
                            : null,
                        hintText: "Cari kode atau nama objek retribusi...",
                        hintStyle: GoogleFonts.roboto(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: _showFilterDialog,
                  ),
                ),
              ],
            ),
          ),

          // Content section
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                    ? Center(child: Text(_errorMessage))
                    : _currentPageData.isEmpty
                        ? Center(child: Text('Tidak ada data yang ditemukan'))
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: _currentPageData.length,
                                  itemBuilder: (context, index) {
                                    final data = _currentPageData[index];
                                    return Card(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: ListTile(
                                        title: Text(
                                          '${data['kodeObjekRetribusi'] ?? '-'} - ${data['objekRetribusi'] ?? '-'}',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Kecamatan ${data['kecamatan'] ?? '-'}',
                                          style:
                                              GoogleFonts.roboto(fontSize: 12),
                                        ),
                                        trailing: Icon(Icons.arrow_right,
                                            color: Colors.black),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FormScreen(
                                                idObjekRetribusi:
                                                    data['idObjekRetribusi']
                                                        .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // Pagination controls
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, -2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // First page button

                                        // Page indicator
                                        Container(),
                                        // Next page button
                                      ],
                                    ),
                                    // Items count indicator
                                  ],
                                ),
                              )
                            ],
                          ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pilih Kecamatan",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Divider(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _fixedKecamatanList.map((kecamatan) {
                  return GestureDetector(
                    onTap: () {
                      _applyFilter(kecamatan);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        kecamatan,
                        style: GoogleFonts.roboto(fontSize: 14),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Divider(),
              Center(
                child: TextButton(
                  onPressed: () {
                    _resetFilter();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Reset Filter",
                    style: GoogleFonts.roboto(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
