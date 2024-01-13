import 'package:flutter/material.dart';
import 'package:flutter_application_crud/mahasiswa.dart';
import 'package:flutter_application_crud/matakuliah.dart';
import 'package:flutter_application_crud/nilai.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MahasiswaApi mahasiswaApi = MahasiswaApi();
  final MatakuliahApi matakuliahApi = MatakuliahApi();
  final NilaiApi nilaiApi = NilaiApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MahasiswaScreen(mahasiswaApi),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Matakuliah'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatakuliahScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Nilai Kuliah'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NilaiKuliahScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MahasiswaScreen extends StatefulWidget {
  final MahasiswaApi apiMahasiswa;

  MahasiswaScreen(this.apiMahasiswa);

  @override
  _MahasiswaScreenState createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  Mahasiswa? _selectedMahasiswa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_selectedMahasiswa == null) {
                        Mahasiswa newMahasiswa = Mahasiswa(
                          id: 0,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await widget.apiMahasiswa.createMahasiswa(newMahasiswa);
                      } else {
                        Mahasiswa updatedMahasiswa = Mahasiswa(
                          id: _selectedMahasiswa!.id,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await widget.apiMahasiswa
                            .updateMahasiswa(updatedMahasiswa);
                        _selectedMahasiswa = null;
                      }

                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      setState(() {});
                    },
                    child: Text(_selectedMahasiswa == null
                        ? 'Create Mahasiswa'
                        : 'Update Mahasiswa'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Mahasiswa>>(
              future: widget.apiMahasiswa.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Mahasiswa> mahasiswaList = snapshot.data!;
                  return ListView.builder(
                    itemCount: mahasiswaList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mahasiswaList[index].nama),
                        subtitle: Text(mahasiswaList[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () async {
                                bool confirmDelete = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Confirm Deletion'),
                                    content: Text(
                                        'Are you sure to delete this item?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context, true);

                                          try {
                                            await widget.apiMahasiswa
                                                .deleteMahasiswa(
                                                    mahasiswaList[index].id);

                                            setState(() {
                                              mahasiswaList.removeAt(index);
                                            });
                                          } catch (e) {
                                            print(
                                                'Error deleting Mahasiswa: $e');
                                            print('StackTrace: ${e}');
                                          }
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text("Delete"),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                _selectedMahasiswa = mahasiswaList[index];
                                _namaController.text = _selectedMahasiswa!.nama;
                                _emailController.text =
                                    _selectedMahasiswa!.email;
                                _tgllahirController.text =
                                    _selectedMahasiswa!.tgllahir;

                                setState(() {});
                              },
                              child: Text("Edit"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MatakuliahScreen extends StatefulWidget {
  @override
  _MatakuliahScreenState createState() => _MatakuliahScreenState();
}

class _MatakuliahScreenState extends State<MatakuliahScreen> {
  final MatakuliahApi _apiService = MatakuliahApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matakuliah Example'),
      ),
      body: FutureBuilder<List<Matakuliah>>(
        future: _apiService.getMatakuliah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Matakuliah> matakuliahList = snapshot.data!;
            return ListView.builder(
              itemCount: matakuliahList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(matakuliahList[index].nama ?? ''),
                  subtitle: Text('SKS: ${matakuliahList[index].sks ?? ''}'),
                  onTap: () async {
                    Matakuliah updatedMatakuliah = Matakuliah(
                      kode: matakuliahList[index].kode,
                      nama: 'Updated Matakuliah',
                      sks: 3,
                    );
                    await _apiService.updateMatakuliah(updatedMatakuliah);

                    setState(() {});
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Matakuliah newMatakuliah = Matakuliah(
            kode: 0,
            nama: 'New Matakuliah',
            sks: 4,
          );
          await _apiService.createMatakuliah(newMatakuliah);

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NilaiKuliahScreen extends StatefulWidget {
  @override
  _NilaiKuliahScreenState createState() => _NilaiKuliahScreenState();
}

class _NilaiKuliahScreenState extends State<NilaiKuliahScreen> {
  final NilaiApi _apiService = NilaiApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example - Nilai Kuliah'),
      ),
      body: FutureBuilder<List<Nilai>>(
        future: _apiService.getNilai(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No data available');
          } else {
            List<Nilai> nilaiList = snapshot.data!;
            return ListView.builder(
              itemCount: nilaiList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('ID: ${nilaiList[index].id}'),
                  subtitle: Text(
                    'Mahasiswa ID: ${nilaiList[index].idmahasiswa}\n'
                    'Matakuliah ID: ${nilaiList[index].idmatakuliah}\n'
                    'Nilai: ${nilaiList[index].nilai}',
                  ),
                  onTap: () async {
                    // Perform any action when a Nilai item is tapped
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
