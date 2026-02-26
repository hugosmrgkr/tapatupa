import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'permohonan.dart';
import 'service/api_service.dart';
import 'dart:math' show Random;

class FormulirPermohonanBaru extends StatefulWidget {
  @override
  _FormulirPermohonanBaruState createState() => _FormulirPermohonanBaruState();
}

class _FormulirPermohonanBaruState extends State<FormulirPermohonanBaru> {
  String? wajibRetribusiSebelumnya;
  bool showWajibRetribusiSebelumnya = false;

  List<Map<String, dynamic>> documents = [];
  List<Map<String, dynamic>> jenisPermohonanOptions = [];
  List<Map<String, dynamic>> objekRetribusiOptions = [];
  List<Map<String, dynamic>> objekWajibRetribusiOptions = [];
  List<Map<String, dynamic>> perioditasOptions = [];
  List<Map<String, dynamic>> peruntukanSewaOptions = [];
  List<Map<String, dynamic>> satuanOptions = [];
  List<Map<String, dynamic>> dokumenKelengkapanOptions = [];

  final TextEditingController catatanController = TextEditingController();
  final TextEditingController lamaSewaController = TextEditingController();

  String? selectedJenisPermohonan;
  String? selectedObjekRetribusi;
  String? selectedPerioditas;
  String? selectedPeruntukanSewa;
  String? selectedWajibRetribusi;
  String? selectedSatuan;
  String nomorPermohonan = '${Random().nextInt(999999999)}';
  String wajibRetribusi = "1";

  @override
  void initState() {
    super.initState();
    fetchJenisPermohonan();
    fetchObjekRetribusi();
    fetchPerioditas();
    fetchPeruntukanSewa();
    fetchWajibRetribusi();
    fetchSatuan();
    fetchDokumenKelengkapan();
    _loadUserData();
  }

  String _namaLengkap = '';
  String _fotoUser = '';
  int _roleId = 0;
  int _idPersonal = 0;

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaLengkap = prefs.getString('namaLengkap') ?? 'Nama tidak ditemukan';
      _fotoUser = prefs.getString('fotoUser') ?? '';
      _roleId = prefs.getInt('roleId') ?? 0;
      _idPersonal = prefs.getInt('idPersonal') ?? 0;
    });
  }

  Future<void> fetchJenisPermohonan() async {
    try {
      final response = await ApiService.get('combo-jenis-permohonan');
      if (response['status'] == 200) {
        setState(() {
          jenisPermohonanOptions =
              List<Map<String, dynamic>>.from(response['jenisPermohonan']);
        });
      }
    } catch (e) {
      print('Error fetching jenis permohonan: $e');
    }
  }

  Future<void> fetchObjekRetribusi() async {
    try {
      final response = await ApiService.get('combo-objek-retribusi');
      if (response['status'] == 200) {
        setState(() {
          objekRetribusiOptions =
              List<Map<String, dynamic>>.from(response['objekRetribusi']);
        });
      }
    } catch (e) {
      print('Error fetching objek retribusi: $e');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> fetchSatuan() async {
    try {
      final response = await ApiService.get('combo-satuan');
      if (response['status'] == 200) {
        setState(() {
          satuanOptions = List<Map<String, dynamic>>.from(response['satuan']);
        });
      }
    } catch (e) {
      print('Error fetching satuan: $e');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> fetchPeruntukanSewa() async {
    try {
      final response = await ApiService.get('combo-peruntukan-sewa');
      if (response['status'] == 200) {
        setState(() {
          peruntukanSewaOptions =
              List<Map<String, dynamic>>.from(response['peruntukanSewa']);
        });
      }
    } catch (e) {
      print('Error fetching peruntukan sewa: $e');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> fetchDokumenKelengkapan() async {
    try {
      final response = await ApiService.get('combo-dokumen-kelengkapan');
      if (response['status'] == 200) {
        setState(() {
          dokumenKelengkapanOptions =
              List<Map<String, dynamic>>.from(response['dokumen']);
        });
      }
    } catch (e) {
      print('Error fetching dokumen kelengkapan: $e');
    }
  }

  Future<void> fetchPerioditas() async {
    try {
      final response = await ApiService.get('combo-perioditas');
      if (response['status'] == 200) {
        setState(() {
          perioditasOptions =
              List<Map<String, dynamic>>.from(response['jangkaWaktu']);
        });
      }
    } catch (e) {
      print('Error fetching perioditas: $e');
      if (e.toString().contains('Unauthorized')) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  Future<void> fetchWajibRetribusi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://tapatupa.taputkab.go.id/api/combo-wajib-retribusi'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['wajibRetribusi'] != null && data['wajibRetribusi'] is List) {
          setState(() {
            objekWajibRetribusiOptions =
                List<Map<String, dynamic>>.from(data['wajibRetribusi']);
          });
        }
      }
    } catch (e) {
      print('Error fetching objek retribusi: $e');
    }
  }

// SEMENTARA (DIPAKAI UTK TEKNO)
  Future<void> submitPermohonan() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final idPersonal = prefs.getInt('idPersonal');
      final idUser = prefs.getInt('id');

      Map<String, String> fields = {
        'jenisPermohonan': selectedJenisPermohonan ?? '',
        'nomorPermohonan': nomorPermohonan,
        'wajibRetribusi': idPersonal?.toString() ?? '',
        'createBy': idUser?.toString() ?? '',
        'dibuatOleh': idUser?.toString() ?? '',
        'objekRetribusi': selectedObjekRetribusi ?? '',
        'perioditas': selectedPerioditas ?? '',
        'peruntukanSewa': selectedPeruntukanSewa ?? '',
        'lamaSewa':
            lamaSewaController.text.isEmpty ? '' : lamaSewaController.text,
        'satuan': selectedSatuan ?? '',
        'catatan': catatanController.text.isEmpty ? '' : catatanController.text,
      };

      if (selectedWajibRetribusi != null &&
          selectedWajibRetribusi!.isNotEmpty) {
        fields['WajibRetribusiSebelumnya'] = selectedWajibRetribusi!;
      }

      final validDocuments = documents
          .where((doc) =>
              doc['filePath'] != null &&
              doc['filePath'].toString().isNotEmpty &&
              doc['name'].toString().isNotEmpty)
          .toList();

      for (var i = 0; i < validDocuments.length; i++) {
        fields['jenisDokumen[$i]'] = validDocuments[i]['name'];
        fields['keteranganDokumen[$i]'] =
            validDocuments[i]['description'] ?? '';
      }

      final response = await ApiService.postMultipart(
        'permohonan-mobile/simpan',
        fields,
        validDocuments.asMap().map((i, doc) => MapEntry(
              'fileDokumen[$i]',
              doc['filePath'],
            )),
      );

      // Regardless of response status, navigate to permohonan page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => permohonan()),
        (route) => false,
      );
    } catch (e) {
      print('Error submitting permohonan: $e');
      // Navigate to permohonan page even if there's an error
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => permohonan()),
        (route) => false,
      );
    }
  }

  void _showSnackbar(String title, String message, ContentType contentType) {
    var snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 200),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + -30),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Formulir Permohonan',
                              style: GoogleFonts.roboto(
                                fontSize: 25,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16),
                        _buildJenisPermohonanDropdown(),
                        SizedBox(height: 16),
                        _buildWajibRetribusiDropdown(),
                        SizedBox(height: 16),
                        _buildObjekRetribusiDropdown(),
                        SizedBox(height: 16),
                        _buildJenisPeruntukanSewaDropdown(),
                        SizedBox(height: 16),
                        _buildPerioditasDropdown(),
                        SizedBox(height: 16),
                        _buildTextField(
                          label: 'Lama Sewa',
                          isNumeric: true,
                          controller: lamaSewaController,
                          labelStyle: GoogleFonts.roboto(),
                        ),
                        SizedBox(height: 16),
                        _buildSatuanDropdown(),
                        SizedBox(height: 16),
                        TextField(
                          controller: catatanController,
                          decoration: InputDecoration(
                            labelText: 'Catatan',
                            labelStyle: GoogleFonts.roboto(),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 12),
                          ),
                          maxLines: 4,
                        ),
                        SizedBox(height: 25),
                        ElevatedButton.icon(
                          onPressed: _addDocumentField,
                          icon: Icon(Icons.add, color: Colors.white),
                          label: Text(
                            'Tambah Dokumen Kelengkapan',
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 32, 66, 188),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), // Add missing parenthesis here
                          ),
                        ),
                        SizedBox(height: 15),
                        Column(
                          children: documents
                              .map((doc) => _buildDocumentField(doc))
                              .toList(),
                        ),
                        ElevatedButton(
                          onPressed: submitPermohonan,
                          child: Text(
                            'Kirim Permohonan',
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 58, 142, 19),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), // Add missing parenthesis here
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    bool isNumeric = false,
    TextEditingController? controller,
    required TextStyle labelStyle,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      inputFormatters:
          isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
    );
  }

  Widget _buildJenisPermohonanDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Jenis Permohonan',
        labelStyle: GoogleFonts.roboto(),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
      value: selectedJenisPermohonan,
      items: jenisPermohonanOptions.map((item) {
        return DropdownMenuItem<String>(
          value: item['idJenisPermohonan'].toString(),
          child: Text(item['jenisPermohonan'], style: GoogleFonts.roboto()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedJenisPermohonan = value;
          showWajibRetribusiSebelumnya = (value == "4");
        });
      },
    );
  }

  Widget _buildPerioditasDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Perioditas',
        labelStyle: GoogleFonts.roboto(),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
      value: selectedPerioditas,
      items: perioditasOptions.map((item) {
        return DropdownMenuItem<String>(
          value: item['idjenisJangkaWaktu'].toString(),
          child: Text(item['jenisJangkaWaktu'], style: GoogleFonts.roboto()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedPerioditas = value;
        });
      },
    );
  }

  Widget _buildJenisPeruntukanSewaDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Jenis Peruntukan Sewa',
        labelStyle: GoogleFonts.roboto(),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
      value: selectedPeruntukanSewa,
      items: peruntukanSewaOptions.map((item) {
        return DropdownMenuItem<String>(
          value: item['idperuntukanSewa'].toString(),
          child: Text(item['peruntukanSewa'], style: GoogleFonts.roboto()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedPeruntukanSewa = value;
        });
      },
    );
  }

  Widget _buildSatuanDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Satuan',
        labelStyle: GoogleFonts.roboto(),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
      value: selectedSatuan,
      items: satuanOptions.map((item) {
        return DropdownMenuItem<String>(
          value: item['idSatuan'].toString(),
          child: Text(item['namaSatuan'], style: GoogleFonts.roboto()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedSatuan = value;
        });
      },
    );
  }

  Widget _buildObjekRetribusiDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Objek Retribusi',
        labelStyle: GoogleFonts.roboto(),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      ),
      value: selectedObjekRetribusi,
      items: objekRetribusiOptions.map((item) {
        return DropdownMenuItem<String>(
          value: item['idObjekRetribusi'].toString(),
          child: Text(
            '${item['objekRetribusi']} - ${item['kodeObjekRetribusi']}',
            style: GoogleFonts.roboto(),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedObjekRetribusi = value;
        });
      },
    );
  }

  Widget _buildWajibRetribusiDropdown() {
    return Visibility(
      visible: showWajibRetribusiSebelumnya,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Nama Wajib Retribusi',
          labelStyle: GoogleFonts.roboto(),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        ),
        isExpanded: true,
        value: selectedWajibRetribusi,
        items: objekWajibRetribusiOptions.map((item) {
          return DropdownMenuItem<String>(
            value: item['idWajibRetribusi'].toString(),
            child: Text('${item['namaWajibRetribusi']}',
                style: GoogleFonts.roboto()),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedWajibRetribusi = value;
          });
        },
      ),
    );
  }

  void _addDocumentField() {
    setState(() {
      documents.add({
        'idDokumenKelengkapan': null,
        'name': '',
        'description': '',
        'filePath': '',
      });
    });
  }

  Widget _buildDocumentField(Map<String, dynamic> doc) {
    int index = documents.indexOf(doc);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dokumen ${index + 1} ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      documents.removeAt(index);
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) => setState(() => doc['name'] = value),
              decoration: InputDecoration(
                labelText: 'Nama Dokumen ',
                labelStyle: GoogleFonts.roboto(),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) => setState(() => doc['description'] = value),
              decoration: InputDecoration(
                labelText: 'Keterangan ',
                labelStyle: GoogleFonts.roboto(),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  String? filePath = result.files.single.path;
                  setState(() {
                    doc['filePath'] = filePath;
                  });
                }
              },
              icon: Icon(Icons.upload_file, color: Colors.white),
              label: Text(
                doc['filePath'] != null && doc['filePath'].toString().isNotEmpty
                    ? 'Ganti File'
                    : 'Upload File ',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 66, 188),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
