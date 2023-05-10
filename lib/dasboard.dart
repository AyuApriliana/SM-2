import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laporan/navbar.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({super.key});

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Jalan Mulus')
        ),
      body: SingleChildScrollView(
        child: Column( 
          children: [
           const SizedBox(height: 50),
        Center( 
          child: Text('Hasil Laporan Jalan Rusak',
          style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: double.infinity,
          height: 240,
          child: Stack(
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 10,
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset("assets/images/lubang5.jpg"),
                  )
                ]
                ),
              ),
               Positioned(bottom: 0, left: 10, 
               child: SizedBox(
                height: 70, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jalan Sudirman',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(
                      width: 10,
                      ),
                    Row(children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text('4,5'), 
                    ],
                    ),
                  ],
                ),),)
            ],
          ),
        ),
         SizedBox(
          width: double.infinity,
          height: 240,
          child: Stack(
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 10,
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset("assets/images/lubang3.jpg"),
                  )
                ]
                ),
              ),
               Positioned(bottom: 0, left: 10, 
               child: SizedBox(
                height: 70, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jalan Diponegoro',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 10,
                      ),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text('5'), 
                    ],
                    ),
                  ],
                ),),)
            ],
          ),
        )
          ],
          ),

      ),
    );
  }
}