import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage(){
    print("constructor STF");
  }
  @override
  _CounterPageState createState(){
    print("createState");
    return _CounterPageState();
  }
} 

class CounterPageState extends State<CounterPage>{
  int counter =0;
  @override
  void initState() {
    super.initState();
    print("initState()");
  }
  @override
  Widget build(BuildContext context) {
    print("build()");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: Center(
        child: Text(
          "$counter",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton{
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Icon(Icon.add),
      },
    );
  }
}

