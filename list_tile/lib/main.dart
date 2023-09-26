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
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              title: Text("Della Putri Herman"),
              subtitle: Text(
                "Teknik komputer kelas Tk 2A Mata kuliah pemrograman mobile lanjut",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(),
              trailing: Text("12:00 AM"),
              tileColor: Colors.purpleAccent,
              // dense: true,
              // onTap: () {
              //   return;
              // },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Song Jong Ki"),
              subtitle: Text("Sedang Mengetik....."),
              leading: CircleAvatar(),
              trailing: Text("09:00 AM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Song Hye Kyo"),
              subtitle: Text("Sedang Mengetik....."),
              leading: CircleAvatar(),
              trailing: Text("07:00 PM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Momo"),
              subtitle: Text("Sedang Mengetik....."),
              leading: CircleAvatar(),
              trailing: Text("08:40 PM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Mumu"),
              subtitle: Text("Sedang Mengetik....."),
              leading: CircleAvatar(),
              trailing: Text("12:00 AM"),
            ),
          ],
        ),
      ),
    );
  }
}
