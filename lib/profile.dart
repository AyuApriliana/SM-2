import 'package:flutter/material.dart';
import 'package:laporan/beranda.dart';
import 'package:laporan/dasboard.dart';
import 'package:laporan/navbar.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Profile"),
        actions: <Widget> [
          TextButton(onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body:
      Center(
        child: Column(
          children: <Widget> [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/pic.png"))
              ),
            ),
            Text("Hary",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 5),
            Text("harybaik@gmail.com",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8492A2)
              ),),
            SizedBox(height: 40),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dasboard()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  children: <Widget> [
                    Icon(Icons.report),
                    SizedBox(width: 20),
                    Text(
                      "Laporan",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF7286A5)
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF7286A5)
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dasboard()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  children: <Widget> [
                    Icon(Icons.report),
                    SizedBox(width: 20),
                    Text(
                      "Laporan",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF7286A5)
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF7286A5)
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dasboard()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  children: <Widget> [
                    Icon(Icons.report),
                    SizedBox(width: 20),
                    Text(
                      "Laporan",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF7286A5)
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF7286A5)
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}