import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:tapatupa/user/pembayaran.dart';

import 'service/api_service.dart';

class detailPerjanjianSewa extends StatefulWidget {
  final int id; // Variabel untuk menerima ID

  detailPerjanjianSewa({required this.id}); // Konstruktor untuk menerima ID

  @override
  _DetailPerjanjianSewaState createState() => _DetailPerjanjianSewaState();
}

class _DetailPerjanjianSewaState extends State<detailPerjanjianSewa> {
  Map<String, dynamic>? _detailPerjanjianSewa;
  List<dynamic>? _tagihanDetail;
  List<bool> _isChecked = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDetailPerjanjianData();
  }

  List<dynamic> _filterUnpaidTagihan(List<dynamic>? tagihanList) {
    if (tagihanList == null) return [];

    // Filter out paid bills and sort by payment number
    var unpaidBills = tagihanList.where((tagihan) {
      String status = (tagihan['namaStatus'] ?? '').toString().toLowerCase();
      return status != 'sudah bayar' && status != 'lunas';
    }).toList();

    // Sort by nomorPembayaran
    unpaidBills.sort((a, b) => (a['nomorTagihan'] ?? '')
        .toString()
        .compareTo((b['nomorTagihan'] ?? '').toString()));

    return unpaidBills;
  }

  Future<void> _fetchDetailPerjanjianData() async {
    try {
      final response =
          await ApiService.get('tagihan-mobile/detail/${widget.id}');

      setState(() {
        _detailPerjanjianSewa = response['headTagihanDetail'];
        // Filter the tagihan list to only show unpaid ones
        _tagihanDetail = _filterUnpaidTagihan(response['tagihanDetail']);
        _isChecked =
            List.generate(_tagihanDetail?.length ?? 0, (index) => false);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _postTagihan() async {
    try {
      int? selectedId;
      for (int i = 0; i < _isChecked.length; i++) {
        if (_isChecked[i]) {
          selectedId = _tagihanDetail?[i]['idTagihanSewa'];
          break;
        }
      }

      if (selectedId == null) {
        _showErrorDialog('Pilih tagihan terlebih dahulu');
        return;
      }

      final response = await ApiService.post(
        'tagihan-mobile/checkout',
        {
          'idPerjanjian': widget.id.toString(),
          'idTagihan': selectedId.toString(),
        },
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PembayaranPage(responseBody: jsonEncode(response)),
        ),
      );
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  String formatRupiah(num? value) {
    if (value == null) return 'Loading...';
    final formatter =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(value);
  }

  num calculateTotalSelected() {
    if (_tagihanDetail == null) return 0;
    for (int i = 0; i < _tagihanDetail!.length; i++) {
      if (_isChecked[i]) {
        return _tagihanDetail![i]['jumlahTagihan'] as num;
      }
    }
    return 0;
  }

  void _showCheckboxDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Text(
              'Anda harus mencentang checkbox pembayaran terlebih dahulu.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Gagal'),
        content: Text('Pembayaran gagal: $errorMessage'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.white, // Pastikan background tetap putih
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Bagian atas dengan gambar
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
                                '                 Detail Sewa ',
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

                Center(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0, -15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Nomor Perjanjian Sewa ',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '        ${_detailPerjanjianSewa?['nomorSuratPerjanjian'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        color: Colors.grey[300], thickness: 1),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Tanggal Disahkan        ',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '           ${_detailPerjanjianSewa?['tanggalDisahkan'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        color: Colors.grey[300], thickness: 1),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Jangka Waktu               ',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '          ${_detailPerjanjianSewa?['durasiSewa'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        color: Colors.grey[300], thickness: 1),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Pembayaran',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '                             ${formatRupiah(_detailPerjanjianSewa?['jumlahPembayaran'] as num?)}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        color: Colors.grey[300], thickness: 1),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Nama Wajib Retribusi',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '            ${_detailPerjanjianSewa?['namaWajibRetribusi'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        color: Colors.grey[300], thickness: 1),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Objek Retribusi',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '                       ${_detailPerjanjianSewa?['kodeObjekRetribusi'] ?? 'Loading...'} - ${_detailPerjanjianSewa?['objekRetribusi'] ?? 'Loading...'}',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Text(
                                "Tagihan",
                                style: GoogleFonts.roboto(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _tagihanDetail?.length ?? 0,
                                itemBuilder: (context, index) {
                                  if (_tagihanDetail == null ||
                                      _tagihanDetail!.isEmpty) {
                                    return Container(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: Text(
                                          'Tidak ada tagihan tersedia',
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final tagihan = _tagihanDetail![index];
                                  final isOverdue = _isTagihanOverdue(
                                      tagihan['tanggalJatuhTempo']);

                                  return Card(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        setState(() {
                                          // Uncheck semua checkbox lainnya
                                          for (int i = 0;
                                              i < _isChecked.length;
                                              i++) {
                                            _isChecked[i] = false;
                                          }
                                          // Check hanya yang dipilih
                                          _isChecked[index] =
                                              !_isChecked[index];
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            // Checkbox dengan custom design
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: _isChecked[index]
                                                      ? Colors.red
                                                      : Colors.grey,
                                                  width: 2,
                                                ),
                                                color: _isChecked[index]
                                                    ? Colors.red
                                                    : Colors.transparent,
                                              ),
                                              child: _isChecked[index]
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 16,
                                                      color: Colors.white,
                                                    )
                                                  : null,
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pembayaran Ke-${index + 1}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'No. Tagihan: ${tagihan['nomorTagihan']}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 13,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Jatuh Tempo: ',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 11,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                      Text(
                                                        tagihan[
                                                            'tanggalJatuhTempo'],
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 11,
                                                          color: isOverdue
                                                              ? Colors.red
                                                              : Colors
                                                                  .grey[600],
                                                          fontWeight: isOverdue
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                        ),
                                                      ),
                                                      if (isOverdue)
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8),
                                                          child: Text(
                                                            '(Terlambat)',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 10,
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              formatRupiah(
                                                  tagihan['jumlahTagihan']),
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: isOverdue
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              // Total Pembayaran di atas
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total : ${formatRupiah(calculateTotalSelected())}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      10), // Memberikan jarak antara Total dan tombol Bayar
                              // Tombol Bayar di bawah
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Logika pembayaran

                                      if (_isChecked.contains(true)) {
                                        print(
                                            'Membayar total: ${calculateTotalSelected()}');
                                        _postTagihan();
                                      } else {
                                        // Jika tidak ada checkbox yang dicentang, tampilkan pop-up
                                        _showCheckboxDialog();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text('Bayar',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool _isTagihanOverdue(String dueDate) {
  try {
    final format = DateFormat('yyyy-MM-dd');
    final due = format.parse(dueDate);
    final now = DateTime.now();
    return now.isAfter(due);
  } catch (e) {
    return false;
  }
}
