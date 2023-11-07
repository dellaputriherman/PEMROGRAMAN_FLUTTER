import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ChangeNotifierProvider(
      create: (context)=> Counter(), child: HomeScreen(), ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    final counter = Provider.of<Counter>(context, Listen: false);
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder(context, value, child) =>Text(
                value.counter.toString(),
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),  
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icon.remove), 
                onPressed:counter.minus,
                ),
                IconButton(icon: Icon(Icon.add), 
                onPressed: counter.add,
                ),
              ],
            )
          ],
        ),
      
    );
  }
}

class Counter with ChangeNotifier {
  int counter = 0;

  int get counter => _counter;

  void add() {
    _counter += 1;
    notifyListeners();
  }
  void minus() {
    _counter -= 1;
    notifyListeners();
  }
}
