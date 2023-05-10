import 'package:flutter/material.dart';
import 'package:laporan/beranda.dart';
import 'package:laporan/dasboard.dart';
import 'package:laporan/home_page.dart';
import 'package:laporan/laporan_page.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Aldi'), 
            accountEmail: Text('aldi@gmail.com'),
            currentAccountPicture: CircleAvatar(),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent
            ),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Dashboard'),
              onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Beranda()));
                    },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Beranda'),
              onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Laporan'),
              onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LaporanPage()));
                    },
            ),
        ],
      ),
    );
  }
}