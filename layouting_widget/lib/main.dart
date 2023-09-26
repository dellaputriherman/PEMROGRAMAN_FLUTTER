import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Column"),
        ),
        body: Stack(
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.purple,
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.green,
            ),
            Container(
              height: 200,
              width: 50,
              color: Colors.pink,
            ),
            Container(
              height: 300,
              width: 50,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
