import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PembayaranPage extends StatefulWidget {
  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedBank;
  double _selectedNominal = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    // Dummy data - Riwayat Pembayaran
    final List<Map<String, dynamic>> pembayaranList = [
      {
        'nomor': 'TRF-2024-045',
        'metode': 'Transfer Bank',
        'nominal': 1500000,
        'tanggal': '15 Jan 2024',
        'bank': 'BNI',
        'status': 'TERIMA',
        'invoiceNo': 'SWF-2024-001',
      },
      {
        'nomor': 'TRF-2024-044',
        'metode': 'Transfer Bank',
        'nominal': 850000,
        'tanggal': '14 Jan 2024',
        'bank': 'Mandiri',
        'status': 'TERIMA',
        'invoiceNo': 'SWF-2024-003',
      },
      {
        'nomor': 'TRF-2024-043',
        'metode': 'Transfer Bank',
        'nominal': 2200000,
        'tanggal': '13 Jan 2024',
        'bank': 'BCA',
        'status': 'TERIMA',
        'invoiceNo': 'SWF-2024-005',
      },
      {
        'nomor': 'TRF-2024-042',
        'metode': 'Transfer Bank',
        'nominal': 1750000,
        'tanggal': '12 Jan 2024',
        'bank': 'BNI',
        'status': 'TERIMA',
        'invoiceNo': 'SWF-2024-007',
      },
    ];

    // Dummy data - Tagihan Belum Bayar untuk tab Bayar
    final List<Map<String, dynamic>> tagihanBelumBayar = [
      {
        'nomor': 'SWF-2024-002',
        'bulan': 'Februari 2024',
        'nominal': 1500000,
        'perjanjian': 'Tempat Usaha Retail',
        'jatuhTempo': '15 Feb 2024',
      },
      {
        'nomor': 'SWF-2024-004',
        'bulan': 'Januari 2024',
        'nominal': 2200000,
        'perjanjian': 'Kantor Cabang',
        'jatuhTempo': '15 Jan 2024',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: screenHeight * 0.15,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF388E3C), Color(0xFF1B5E20)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                            child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 28),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Pembayaran',
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle:
                  GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
              splashFactory: NoSplash.splashFactory,
              tabs: const [
                Tab(text: 'Riwayat'),
                Tab(text: 'Bayar Tagihan'),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Riwayat Pembayaran
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  itemCount: pembayaranList.length,
                  itemBuilder: (context, index) {
                    final item = pembayaranList[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
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
                                        item['nomor'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item['metode'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item['status'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.grey[200],
                              height: 1,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bank',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      item['bank'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Nominal',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      currencyFormat
                                          .format(item['nominal']),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF388E3C),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Tanggal: ${item['tanggal']}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Tab 2: Bayar Tagihan (VA Layout)
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pilih Tagihan
                      Text(
                        'Pilih Tagihan',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12),
                      ...tagihanBelumBayar.map((tagihan) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedNominal =
                                  (tagihan['nominal'] as num).toDouble();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: _selectedNominal ==
                                      (tagihan['nominal'] as num)
                                          .toDouble()
                                  ? Color(0xFF388E3C).withOpacity(0.1)
                                  : Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _selectedNominal ==
                                        (tagihan['nominal'] as num)
                                            .toDouble()
                                    ? Color(0xFF388E3C)
                                    : Colors.grey[300]!,
                                width: _selectedNominal ==
                                        (tagihan['nominal'] as num)
                                            .toDouble()
                                    ? 2
                                    : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tagihan['nomor'],
                                        style:
                                            GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight:
                                              FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '${tagihan['perjanjian']} - ${tagihan['bulan']}',
                                        style:
                                            GoogleFonts.poppins(
                                          fontSize: 10,
                                          color:
                                              Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  currencyFormat.format(
                                      tagihan['nominal']),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF388E3C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 24),

                      // Pilih Bank VA
                      Text(
                        'Pilih Bank',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12),
                      ...[
                        {'name': 'BNI', 'code': 'bni', 'va': '8272-1234-567-890'},
                        {'name': 'BCA', 'code': 'bca', 'va': '1234-567-8901-234'},
                        {
                          'name': 'Mandiri',
                          'code': 'mandiri',
                          'va': '1234-567-8901'
                        },
                      ].map((bank) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedBank = bank['code'];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: _selectedBank == bank['code']
                                  ? Color(0xFF388E3C).withOpacity(0.1)
                                  : Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _selectedBank == bank['code']
                                    ? Color(0xFF388E3C)
                                    : Colors.grey[300]!,
                                width:
                                    _selectedBank == bank['code'] ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bank['name']!,
                                      style:
                                          GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight:
                                            FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'VA: ${bank['va']}',
                                      style:
                                          GoogleFonts.poppins(
                                        fontSize: 10,
                                        color:
                                            Colors.grey[600],
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                if (_selectedBank == bank['code'])
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFF388E3C),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check,
                                          color: Colors.white,
                                          size: 14),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 24),

                      // Payment Summary
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green[200]!,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ringkasan Pembayaran',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nominal:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _selectedNominal > 0
                                      ? currencyFormat
                                          .format(_selectedNominal)
                                      : '-',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF388E3C),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _selectedBank?.toUpperCase() ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _selectedNominal > 0 &&
                                  _selectedBank != null
                              ? () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pembayaran via ${_selectedBank?.toUpperCase()} sebesar ${currencyFormat.format(_selectedNominal)} diproses...',
                                        style:
                                            GoogleFonts.poppins(),
                                      ),
                                      backgroundColor:
                                          Colors.green,
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF388E3C),
                            disabledBackgroundColor:
                                Colors.grey[400],
                            padding: EdgeInsets.symmetric(
                                vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            'Proses Pembayaran',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
