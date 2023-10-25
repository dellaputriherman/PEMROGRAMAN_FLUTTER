import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexibel dan Expended"),
      ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              color: Colors.pink,
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView(
              children: [
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
