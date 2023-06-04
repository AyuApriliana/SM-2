import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:laporan/beranda.dart';
import 'package:laporan/home_page.dart';
import 'package:laporan/laporan_page.dart';
import 'package:laporan/navbar.dart';
import 'package:laporan/laporan_data.dart'; // Import LaporanData

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => LaporanData(), // Buat instance LaporanData
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // drawer: Navbar(),
          // appBar: AppBar(
          //   title: const Text('Jalan Mulus'),
          //   backgroundColor: Colors.lightBlueAccent,
          // ),
          body: Beranda(),
        ),
      ),
    );
  }
}
