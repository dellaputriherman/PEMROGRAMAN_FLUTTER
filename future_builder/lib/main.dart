import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> ambilData() async {
    var hasilGet = await http.get(
      Url.parse("https://reqres.in/api/users?page=2"),
    );

    var data = json.decode(hasilGet.body)["data"] as Map<String, dynamic>;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "NAMA",
                style: TextStyle(fontSize: 35),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ambilData,
      ),
    );
  }
}
