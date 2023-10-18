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
          title: Text("Dialog"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Telah diklik");
          },
          child: Icon(Icons.delete),
        ),
      ),
    );
  }
}
