// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class profile_edit extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       child: Container(
//                         height: screenHeight / 16 +
//                             MediaQuery.of(context).padding.top,
//                         width: double.infinity,
//                         child: ColorFiltered(
//                           colorFilter: ColorFilter.mode(
//                             Colors.black
//                                 .withOpacity(0.5), // Menambahkan opacity
//                             BlendMode.darken,
//                           ),
//                           child: Image.asset(
//                             'assets/gorgabatak.jpg',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 40,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 16,
//                         ),
//                         child: Row(
//                           children: [
//                             // Tombol Back
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                                 size: 22,
//                               ),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             // Judul
//                             Center(
//                               child: Text(
//                                 '             Edit Profile',
//                                 style: GoogleFonts.roboto(
//                                   fontSize: 25,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 // Menghapus box decoration untuk Mei Pane dan ID
//                 Container(
//                   margin: EdgeInsets.all(16),
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 8,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Profile Info Section
//                       Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[50],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.person, color: Colors.black38),
//                                 SizedBox(width: 16),
//                                 Expanded(
//                                   child: Text(
//                                     'Miranda',
//                                     style: GoogleFonts.roboto(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Icon(Icons.credit_card, color: Colors.black38),
//                                 SizedBox(width: 16),
//                                 Expanded(
//                                   child: Text(
//                                     '1212394053374739',
//                                     style: GoogleFonts.roboto(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Icon(Icons.phone, color: Colors.black38),
//                                 SizedBox(width: 16),
//                                 Expanded(
//                                   child: Text(
//                                     '081377060672',
//                                     style: GoogleFonts.roboto(
//                                       fontSize: 16,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 25),

//                       // Phone Number Section
//                       Text(
//                         'No. Telepon',
//                         style: GoogleFonts.roboto(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Cth : 082167663638',
//                         style: GoogleFonts.roboto(
//                           fontSize: 12,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ProfileInputField(
//                         hintText: '081377060672',
//                       ),
//                       SizedBox(height: 25),

//                       // Address Section
//                       Text(
//                         'Alamat',
//                         style: GoogleFonts.roboto(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Cth : Toko Mei, Pasar I Kecamatan Sipoholon, Kabupaten Tapanuli Utara, Sumatera Utara',
//                         style: GoogleFonts.roboto(
//                           fontSize: 12,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ProfileInputField(
//                         hintText:
//                             'Gedung Fairgrounds Lt 5-10, JL SCBD No 126, Jakarta Selatan',
//                         maxLines: 3,
//                       ),
//                       SizedBox(height: 40),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.redAccent, // Warna background button
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     ),
//                     onPressed: () {
//                       // Aksi saat tombol "Simpan" ditekan
//                     },
//                     child: Text('Simpan',
//                         style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileInputField extends StatelessWidget {
//   final String hintText;
//   final int maxLines;

//   ProfileInputField({required this.hintText, this.maxLines = 1});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3), // Posisi shadow
//           ),
//         ],
//       ),
//       child: TextField(
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profile_edit extends StatefulWidget {
  final String nik;
  final String alamat;
  final String noPonsel;

  profile_edit({
    required this.nik,
    required this.alamat,
    required this.noPonsel,
  });

  @override
  State<profile_edit> createState() => _profile_editState();
}

class _profile_editState extends State<profile_edit> {
  late TextEditingController nikController;
  late TextEditingController alamatController;
  late TextEditingController noPonselController;

  @override
  void initState() {
    super.initState();
    nikController = TextEditingController(text: widget.nik);
    alamatController = TextEditingController(text: widget.alamat);
    noPonselController = TextEditingController(text: widget.noPonsel);
  }

  @override
  void dispose() {
    nikController.dispose();
    alamatController.dispose();
    noPonselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        height: screenHeight / 16 +
                            MediaQuery.of(context).padding.top,
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
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
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
                            Center(
                              child: Text(
                                '             Edit Profile',
                                style: GoogleFonts.roboto(
                                  fontSize: 25,
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
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NIK Section
                      Text(
                        'NIK',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ProfileInputField(
                        controller: nikController,
                        hintText: 'Masukkan NIK',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 25),

                      // Phone Number Section
                      Text(
                        'No. Telepon',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      ProfileInputField(
                        controller: noPonselController,
                        hintText: 'Cth : 082167663638',
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 25),

                      // Address Section
                      Text(
                        'Alamat',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ProfileInputField(
                        controller: alamatController,
                        hintText: 'Masukkan alamat lengkap',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    onPressed: () {
                      // Aksi simpan data
                      // String nikBaru = nikController.text;
                      // String alamatBaru = alamatController.text;
                      // String noPonselBaru = noPonselController.text;
                    },
                    child: Text('Simpan',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
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

class ProfileInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;

  ProfileInputField({
    this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
