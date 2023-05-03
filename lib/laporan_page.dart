import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laporan/image_form.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:laporan/navbar.dart';


class LaporanPage extends StatefulWidget {
  const LaporanPage({Key? key}) : super(key:key);

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent ,
        // leading: const Icon(Icons.menu),
        title: const Text('LAPORAN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50, right: 15),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon( Icons.image,),
                   Text('Image'),
                ]
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ImageForm()
                )
              ),                   
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                height: 40,                  
                child: const Row(
                  children: [
                    const Text('  Input Image', textAlign: TextAlign.center),
                  ]
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),                      
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: 
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon( Icons.add_location_alt,),
                    Text('Location'),
                  ]
                ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Location",
                  labelText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ), 
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: 
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Description'),
                  ]
              ),
            ),
            Container(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",                        
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),                          
                  ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextButton(
                onPressed: () {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Laporan berhasil dikirim",
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade600),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ), 
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
      ]),
    );                      
  }
  
}
