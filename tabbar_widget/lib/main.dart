import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      text: "Tab 1",
      icon: Icon(Icons.add_a_photo),
    ),
    Tab(
      icon: Icon(Icons.abc_outlined),
    ),
    Tab(
      text: "Tab 3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Apps"),
            bottom: TabBar(
              indicatorColor: Colors.deepPurple,
              indicatorWeight: 5,
              indicatorPadding: EdgeInsets.all(2),
              indicator: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              tabs: myTab,
            ),
          ),
        ),
      ),
    );
  }
}
