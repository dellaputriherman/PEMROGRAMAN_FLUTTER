import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
              value: statusSwitch,
              onChanged: (value) {
                setState(() {
                  statusSwitch = !statusSwitch;
                });
                print(statusSwitch);
              },
            ),
            Text(
              (statusSwitch == true) ? "Switch On" : "Switch Off",
              style: TextStyle(
                fontSize: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
