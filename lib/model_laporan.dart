class Laporan {
  final BigInt id;
  final String image;
  final String lokasi;
  final String keterangan;


  Laporan({
    required this.id,
    required this.image,
    required this.lokasi,
    required this.keterangan,
    
  });

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      id: BigInt.from(json['id']),
      image: json['image'],
      lokasi: json['lokasi'],
      keterangan: json['keterangan'],
      
    );
  }
}