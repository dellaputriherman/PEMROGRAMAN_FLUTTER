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
        leadingWidth: 50,
        title: Container(
          //width: 35,
          height: 35,
          color: Colors.purpleAccent,
        ),
        //titleSpacing: 0,
        centerTitle: false,
        actions: [
          Container(
            width: 50,
            //height: 35,
            color: Colors.red,
          ),
          Container(
            width: 50,
            //height: 35,
            color: Colors.brown,
          ),
          Container(
            width: 50,
            //height: 35,
            color: Colors.red,
          ),
          Container(
            width: 50,
            //height: 35,
            color: Colors.brown,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
            width: 50,
            height: 200,
            color: Colors.deepPurple,
          ),
        ),
        flexibleSpace: Container(
          //width: 50,
          height: 200,
          color: Colors.green,
        ),
      )),
    );
  }
}
