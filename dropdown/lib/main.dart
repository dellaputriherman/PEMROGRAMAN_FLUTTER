import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [
    "Brazil",
    "Italia (Disabled)",
    "Tunisia",
    'Canada',
    'Indonesia',
    'India',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DropdownSearch<String>(
            showClearButton: true,
            mode: Mode.MENU,
            showSelectedItem: true,
            items: data,
            label: "Menu mode",
            hint: "country in menu mode",
            popupItemDisabled: (String s) => s.startsWith('Italia'),
            onChanged: (value) {
              print(value);
            },
            dropdownSearchDecoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
