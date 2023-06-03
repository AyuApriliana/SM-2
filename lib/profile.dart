import 'package:flutter/material.dart';
import 'package:laporan/beranda.dart';
import 'package:laporan/dasboard.dart';
import 'package:laporan/navbar.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/pic.png"),
            ),
            SizedBox(height: 20),
            Text(
              "Hary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "harybaik@gmail.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8492A2),
              ),
            ),
            SizedBox(height: 40),
            buildMenuItem(Icons.person, "Profil"),
            buildMenuItem(Icons.settings, "Pengaturan"),
            buildMenuItem(Icons.lock, "Keamanan"),
            buildMenuItem(Icons.help, "Bantuan"),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Keluar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 24,
            color: Color(0xFF7286A5),
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF7286A5),
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF7286A5),
          ),
        ],
      ),
    );
  }
}
