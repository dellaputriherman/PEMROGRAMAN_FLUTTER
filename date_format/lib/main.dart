import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Format"),
        ),
        body: Center(
          child: Text(
            DateTime(2023, 10, 18, 10, 20).toString(),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
