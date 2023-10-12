import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Della Putri Herman",
      "Age": 19,
      "favcolor": ["Black", "White", "Green", "Blue", "White", "Green"],
    },
    {
      "Name": "Daniel",
      "Age": 20,
      "favcolor": ["Red", "Amber", "White", "Green"],
    },
    {
      "Name": "Rani",
      "Age": 20,
      "favcolor": ["White", "Green", "Black", "Amber"]
    },
    {
      "Name": "Momo",
      "Age": 15,
      "favcolor": ["Black", "White", "Green", "Blue", "White", "Green"],
    },
    {
      "Name": "Mumu",
      "Age": 13,
      "favcolor": ["White", "Green", "Black", "Amber"]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ID Apps"),
        ),
        body: ListView(
          children: myList.map((data) {
            print(data["favcolor"]);
            List myfavcolor = data["favcolor"];
            print("----------");
            print(myfavcolor);
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.purpleAccent.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${data['Name']}"),
                            Text("Age : ${data['Age']}"),
                          ],
                        ),
                      ],
                    ),
                    //favcolor
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: myfavcolor.map((Color) {
                          return Container(
                            color: Colors.pink,
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(Color),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
