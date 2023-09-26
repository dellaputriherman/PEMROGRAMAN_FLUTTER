import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Della Putri Herman"),
        ),
        body: Center(
          child: Text(
            "Hallo Nama Saya Della Putri Herman dari Kelas TK 2A Prodi Teknik Komputer Mata Kuliah Pemograman Mobile Lanjut",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.pinkAccent,
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Stick',
              decorationStyle: TextDecorationStyle.dotted,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
              decorationThickness: 5,
            ),
          ),
        ),
      ),
    );
  }
}
