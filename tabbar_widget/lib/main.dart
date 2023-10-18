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
      text: "Tab 2",
    ),
    Tab(
      icon: Icon(Icons.accessibility_rounded),
      text: "Tab 3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 2,
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Apps"),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              // indicatorColor: Colors.deepPurple,
              // indicatorWeight: 5,
              // indicatorPadding: EdgeInsets.all(2),
              indicator: BoxDecoration(
                  color: Colors.pinkAccent,
                  //borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 5,
                    ),
                  )),
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  "Tab 1",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Tab 2",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Tab 3",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
