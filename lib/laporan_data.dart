import 'package:flutter/foundation.dart';

class LaporanData extends ChangeNotifier {
  String image = '';
  String lokasi = '';
  String keterangan = '';

  void updateLaporan(String newImage, String newLokasi, String newKeterangan) {
    image = newImage;
    lokasi = newLokasi;
    keterangan = newKeterangan;
    notifyListeners();
  }
}
