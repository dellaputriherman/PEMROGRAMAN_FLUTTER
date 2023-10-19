import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/output': (context) => OutputPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String idPelanggan = '';
  String namaPelanggan = '';
  String meteranAwal = '';
  String meteranAkhir = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDAM PADANG'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/pdg.jpeg"),
            Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'PDAM PADANG',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'ID Pelanggan'),
              onChanged: (value) {
                idPelanggan = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
              onChanged: (value) {
                namaPelanggan = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Meteran Awal'),
              onChanged: (value) {
                meteranAwal = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Meteran Akhir'),
              onChanged: (value) {
                meteranAkhir = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/output',
                  arguments: {
                    'idPelanggan': idPelanggan,
                    'namaPelanggan': namaPelanggan,
                    'meteranAwal': meteranAwal,
                    'meteranAkhir': meteranAkhir,
                  },
                );
              },
              child: Text('Proses'),
            ),
          ],
        ),
      ),
    );
  }
}

class OutputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String idPelanggan = data['idPelanggan'];
    String namaPelanggan = data['namaPelanggan'];
    String meteranAwal = data['meteranAwal'];
    String meteranAkhir = data['meteranAkhir'];
    int totalMeteran = int.parse(meteranAkhir) - int.parse(meteranAwal);
    int biayaPerMeter = 5000;
    int totalBiaya = totalMeteran * biayaPerMeter;
    double pajak = totalBiaya * 0.05;
    double totalPembayaran = totalBiaya + pajak;

    return Scaffold(
      appBar: AppBar(
        title: Text('Output Page'),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('ID Pelanggan: $idPelanggan'),
            Text('Nama Pelanggan: $namaPelanggan'),
            Text('Total Meteran: $totalMeteran'),
            Text('Total Biaya: $totalBiaya'),
            Text('Pajak: $pajak'),
            Text('Total Pembayaran: $totalPembayaran'),
          ],
        ),
      ),
    );
  }
}
