class Laporan {
  final BigInt id;
  final String images;
  final String keterangan;
  final String lokasi;

  Laporan({
    required this.id,
    required this.images,
    required this.keterangan,
    required this.lokasi,
  });

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      id: BigInt.from(json['id']),
      images: json['images'],
      keterangan: json['keterangan'],
      lokasi: json['lokasi'],
    );
  }
}