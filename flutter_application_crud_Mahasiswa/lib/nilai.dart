class Nilai {
  int? id;
  int? idmahasiswa;
  int? idmatakuliah;
  double? nilai;

  Nilai({this.id, this.idmahasiswa, this.idmatakuliah, this.nilai});

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      id: json['id'],
      idmahasiswa: json['idmahasiswa'],
      idmatakuliah: json['idmatakuliah'],
      nilai: json['nilai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idmahasiswa': idmahasiswa,
      'idmatakuliah': idmatakuliah,
      'nilai': nilai,
    };
  }

  @override
  String toString() {
    return 'Nilai{id: $id, idmahasiswa: $idmahasiswa, idmatakuliah: $idmatakuliah, nilai: $nilai}';
  }
}
