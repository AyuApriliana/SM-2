import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laporan/model_laporan.dart';

class RepositoryLaporan {
  final baseUrl = 'http://10.0.0.2:8000/api/laporan';

  Future<List<Laporan>> getData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        List<dynamic> data = json['data'];
        List<Map<String, dynamic>> dataList =
            List<Map<String, dynamic>>.from(data);
        List<Laporan> laporanList =
            dataList.map((item) => Laporan.fromJson(item)).toList();
        return laporanList;
      }
    } catch (e) {
      print(e.toString());
    }

    return []; // Return an empty list if an error occurs
  }

  String getImageUrl(String filename) {
    return Uri.parse('http://192.168.1.5:8000/api/file/$filename')
        .toString(); // Include the base URL when constructing the image URL
  }
}