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
        leading: Container(
          color: Colors.pinkAccent,
        ),
        leadingWidth: 100,
        title: Container(
          //width: 35,
          height: 35,
          color: Colors.purpleAccent,
        ),
        //titleSpacing: 0,
        centerTitle: false,
      )),
    );
  }
}
