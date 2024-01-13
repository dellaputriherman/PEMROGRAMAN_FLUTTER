class Matakuliah {
  int? kode;
  String? nama;
  int? sks;

  Matakuliah({this.kode, this.nama, this.sks});

  factory Matakuliah.fromJson(Map<String, dynamic> json) {
    return Matakuliah(
      kode: json['kode'],
      nama: json['nama'],
      sks: json['sks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kode': kode,
      'nama': nama,
      'sks': sks,
    };
  }

  @override
  String toString() {
    return 'Matakuliah{kode: $kode, nama: $nama, sks: $sks}';
  }
}
