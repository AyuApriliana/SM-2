import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:laporan/laporan_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String apiUrl = 'http://127.0.0.1:8000/api/laporan/'; // Ganti dengan URL API yang sesuai

  Future<List<dynamic>> fetchLaporan() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final dataLaporan = jsonDecode(response.body);
      return dataLaporan['data'];
    } else {
      throw Exception('Failed to fetch laporan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Jalan Mulus'),
      ),
      backgroundColor: Colors.white,
      body: Consumer<LaporanData>(
        builder: (context, laporanData, child) {
          return Column(
            children: [
              // Menampilkan data laporan
              Text('Image: ${laporanData.image}'),
              Text('Lokasi: ${laporanData.lokasi}'),
              Text('Keterangan: ${laporanData.keterangan}'),

              // ...
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchLaporan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final laporanList = snapshot.data!;
                      return ListView.builder(
                        itemCount: laporanList.length,
                        itemBuilder: (context, index) {
                          final laporan = laporanList[index];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.network(laporan['image']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        laporan['lokasi'],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.yellow),
                                          SizedBox(width: 5),
                                          Text(
                                            laporan['keterangan'].toString(),
                                            style: GoogleFonts.montserrat(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Failed to fetch laporan'));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
