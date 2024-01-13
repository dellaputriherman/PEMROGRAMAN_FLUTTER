import 'dart:convert';

import 'package:flutter_application_crud/mahasiswa.dart';
import 'package:flutter_application_crud/matakuliah.dart';
import 'package:flutter_application_crud/nilai.dart';
import 'package:http/http.dart' as http;

class MahasiswaApi {
  static const String baseUrl = 'http://192.168.97.121:9001/api/v1/mahasiswa';

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Mahasiswa.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load mahasiswa');
    }
  }

  Future<Mahasiswa> createMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(mahasiswa.toJson()),
    );

    if (response.statusCode == 200) {
      return Mahasiswa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create mahasiswa');
    }
  }

  Future<Mahasiswa> updateMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${mahasiswa.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(mahasiswa.toJson()),
    );

    if (response.statusCode == 200) {
      return Mahasiswa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update mahasiswa');
    }
  }

  Future<void> deleteMahasiswa(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete mahasiswa');
    }
  }
}

class MatakuliahApi {
  static const String baseUrl = 'http://192.168.97.121:9002/api/v1/matakuliah';

  Future<List<Matakuliah>> getMatakuliah() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Matakuliah.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load matakuliah');
    }
  }

  Future<Matakuliah> createMatakuliah(Matakuliah matakuliah) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(matakuliah.toJson()),
    );

    if (response.statusCode == 200) {
      return Matakuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create matakuliah');
    }
  }

  Future<Matakuliah> updateMatakuliah(Matakuliah matakuliah) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${matakuliah.kode}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(matakuliah.toJson()),
    );

    if (response.statusCode == 200) {
      return Matakuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update matakuliah');
    }
  }

  Future<void> deleteMatakuliah(int kode) async {
    final response = await http.delete(Uri.parse('$baseUrl/$kode'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete matakuliah');
    }
  }
}

class NilaiApi {
  static const String baseUrl = 'http://192.168.97.121:9003/api/v1/nilai';

  Future<List<Nilai>> getNilai() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Nilai.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load nilai');
    }
  }

  Future<Nilai> createNilai(Nilai nilai) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nilai.toJson()),
    );

    if (response.statusCode == 200) {
      return Nilai.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create nilai');
    }
  }

  Future<Nilai> updateNilai(Nilai nilai) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${nilai.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nilai.toJson()),
    );

    if (response.statusCode == 200) {
      return Nilai.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update nilai');
    }
  }

  Future<void> deleteNilai(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete nilai');
    }
  }
}
