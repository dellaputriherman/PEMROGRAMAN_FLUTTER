import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text(
          "GALLERY PAGE",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
