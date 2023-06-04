import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laporan/dasboard.dart';
import 'package:laporan/home_page.dart';
import 'package:laporan/laporan_page.dart';
import 'package:laporan/camera.dart';
import 'package:laporan/navbar.dart';
import 'package:laporan/profile.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    var montserrat = GoogleFonts.montserrat(
          fontSize: 12);
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Jalan Mulus')
        ),
        body: GridView.count(
          padding: EdgeInsets.all(25), 
          crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              splashColor: Colors.amber,
              child: Center(child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.book, size: 70, color: Colors.amber),
                  Text("Hasil Laporan", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                ],
              )),
              ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LaporanPage()));
              },
              splashColor: Colors.amber,
              child: Center(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.upload, size: 70, color: Colors.red,),
                  Text("Kirim Laporan", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                 ],
              ),
              ),
              ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
              },
              splashColor: Colors.amber,
              child: Center(child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.person, size: 70, color: Colors.blueGrey,),
                  Text("Profil", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                ],
              )),
              ),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
        ]),
    );
  }
}