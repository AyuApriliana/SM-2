import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:laporan/model_laporan.dart';
import 'package:laporan/rep_laporan.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Laporan> listLaporan = [];
  RepositoryLaporan repository = RepositoryLaporan();

  getData() async {
    listLaporan = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Jalan Mulus'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listLaporan.length, // Use the actual length of the list
                itemBuilder: (context, index) {
                  if (index >= listLaporan.length) {
                    return SizedBox(); // Return an empty widget if the index is out of range
                  }
                  final laporan = listLaporan[index];
                  final imageUrl = repository.getImageUrl(laporan.image);
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        width: 250,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child:ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(laporan.lokasi),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  );
                },
              ),
    );
  }
  
}