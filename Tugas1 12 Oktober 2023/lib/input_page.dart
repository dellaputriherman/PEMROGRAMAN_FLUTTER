import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController nobpController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController mtkController = TextEditingController();
  TextEditingController bIngController = TextEditingController();
  TextEditingController javaController = TextEditingController();

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  );

  final TextStyle buttonTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple, // Warna latar belakang pink
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildLinedTextField(nobpController, "Nomor BP         "),
            buildLinedTextField(namaController, "Nama                 "),
            buildLinedTextField(mtkController, "Matematika       "),
            buildLinedTextField(bIngController, "Bahasa Inggris  "),
            buildLinedTextField(javaController, "Java                    "),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          nobp: nobpController.text,
                          nama: namaController.text,
                          mtk: mtkController.text,
                          bIng: bIngController.text,
                          java: javaController.text,
                        ),
                      ),
                    );
                  },
                  child: Text("Submit",
                      style:
                          buttonTextStyle), // Mengatur warna teks menjadi putih
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    nobpController.clear();
                    namaController.clear();
                    mtkController.clear();
                    bIngController.clear();
                    javaController.clear();
                  },
                  child: Text("Reset",
                      style:
                          buttonTextStyle), // Mengatur warna teks menjadi putih
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLinedTextField(
      TextEditingController controller, String labelText) {
    return Row(
      children: [
        Text(
          labelText + " :",
          style: TextStyle(
              color: Colors.white), // Mengatur warna teks menjadi putih
        ),
        SizedBox(width: 10),
        Container(
          width: 150, // Sesuaikan lebar kotak sesuai kebutuhan
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: outlineInputBorder,
              isDense: true, // Mengurangi jarak antara teks dan garis
            ),
          ),
        ),
      ],
    );
  }
}
