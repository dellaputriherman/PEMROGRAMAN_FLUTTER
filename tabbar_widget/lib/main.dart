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
          title: Text("My Apps"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Text("Bottom"),
          ),
        ),
      ),
    );
  }
}
