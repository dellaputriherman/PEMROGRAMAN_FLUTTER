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
          title: Text("Dynamic Apps"),
        ),
        body: Column(
          children: [
            Text("1"),
            Row(
              children: [
                RaisedButton(
                  onPressed: null,
                  child: Icon(Icons.add),
                ),
                RaisedButton(
                  onPressed: null,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
