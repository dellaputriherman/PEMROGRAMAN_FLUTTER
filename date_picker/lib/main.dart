import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                        helpText: "Help Text",
                        cancelText: "Cancel Text",
                        confirmText: "Confirm Text",
                        fieldHintText: "Masukkan tanggal lahir Anda",
                        fieldLabelText: "Field Label Text",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child!,
                          );
                        })!
                    .then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        selectDate = value;
                      });
                    }
                  },
                );
              },
              child: Text("Date Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
