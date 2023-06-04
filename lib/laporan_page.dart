import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'package:laporan/image_form.dart';
import 'package:laporan/laporan_data.dart';
import 'package:provider/provider.dart';

class LaporanPage extends StatefulWidget {
  final String apiUrl = 'http://127.0.0.1:8000/api/laporan/'; // Ganti dengan URL API yang sesuai

  const LaporanPage({Key? key}) : super(key: key);

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  String image = '';
  String lokasi = '';
  String keterangan = '';

  void sendLaporan() async {
    final response = await http.post(
      Uri.parse(widget.apiUrl),
      body: {
        'image': image,
        'lokasi': lokasi,
        'keterangan': keterangan,
      },
    );

    final laporanData = Provider.of<LaporanData>(context, listen: false);
    laporanData.updateLaporan(image, lokasi, keterangan);

    if (response.statusCode == 200) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Laporan sent",
      );
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Failed to send laporan",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('LAPORAN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50, right: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.image),
                  Text('Image'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageForm()),
                );
                if (result != null && result is String) {
                  setState(() {
                    image = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                height: 40,
                child: Row(
                  children: [
                    const Text('  Input Image', textAlign: TextAlign.center),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_location_alt),
                  Text('Location'),
                ],
              ),
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    lokasi = value;
                  });
                },
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Description'),
                ],
              ),
            ),
            Container(
              height: 100,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    keterangan = value;
                  });
                },
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
                  sendLaporan();
                },
                style: TextButton.styleFrom(backgroundColor: Colors.green.shade600),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
