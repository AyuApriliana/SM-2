import 'package:flutter/material.dart';
import 'package:laporan/laporan_page.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Aldi'), 
            accountEmail: Text('aldi@gmail.com'),
            currentAccountPicture: CircleAvatar(),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent
            ),
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