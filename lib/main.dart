import 'package:flutter/material.dart';
import 'package:laporan/laporan_page.dart';
import 'package:laporan/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Jalan Mulus'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Center(
        child: Text(
          'Main Page', 
        style: TextStyle(fontSize: 40),
      )),
    ),
    );
  }
}
