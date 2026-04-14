import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermohonanPage extends StatefulWidget {
  @override
  State<PermohonanPage> createState() => _PermohonanPageState();
}

class _PermohonanPageState extends State<PermohonanPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  String? _selectedObjek, _selectedLokasi;
  Map<String, bool> _uploadedDocs = {'KTP': false, 'Domisili': false};

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

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _selectedObjek = null;
      _selectedLokasi = null;
      _uploadedDocs = {'KTP': false, 'Domisili': false};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.14,
            backgroundColor: Colors.transparent,
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
                      Icon(Icons.description_outlined, color: Colors.white.withOpacity(0.9), size: 32),
                      SizedBox(height: 8),
                      Text('PERMOHONAN SEWA', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700),
              tabs: const [Tab(text: 'Riwayat'), Tab(text: 'Buat Permohonan')],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20), children: [Text('Riwayat Permohonan', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700))]),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data Permohonan', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700)),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _selectedObjek,
                          items: ['Tempat Usaha', 'Toko', 'Kantor'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (value) => setState(() => _selectedObjek = value),
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), hintText: 'Pilih objek'),
                          validator: (value) => value == null ? 'Pilih objek' : null,
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _selectedLokasi,
                          items: ['Lokasi A', 'Lokasi B', 'Lokasi C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (value) => setState(() => _selectedLokasi = value),
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), hintText: 'Pilih lokasi'),
                          validator: (value) => value == null ? 'Pilih lokasi' : null,
                        ),
                    SizedBox(height: 24),
                        Text('Dokumen', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700)),
                        SizedBox(height: 12),
                        ..._uploadedDocs.keys.map((doc) => Padding(padding: EdgeInsets.only(bottom: 8), child: GestureDetector(onTap: () => setState(() => _uploadedDocs[doc] = !_uploadedDocs[doc]!), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[300]!)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(doc), Icon(_uploadedDocs[doc]! ? Icons.check : Icons.upload)]))))).toList(),
                        SizedBox(height: 24),
                        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { if (_formKey.currentState!.validate()) { bool allDocs = _uploadedDocs.values.every((v) => v); if (!allDocs) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload semua dokumen'), backgroundColor: Colors.orange)); return; } showDialog(context: context, builder: (ctx) => AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), title: Text('Konfirmasi', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Batal')), ElevatedButton(onPressed: () { Navigator.pop(ctx); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Berhasil!'), backgroundColor: Colors.green)); _resetForm(); }, child: Text('Ajukan'))])); } }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFDC3545), padding: EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text('Ajukan', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)))),
                      ],
                    ),
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
