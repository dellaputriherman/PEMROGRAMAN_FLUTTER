import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var faker = new Faker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Extract Widget"),
        ),
        body: ListView(
          children: [
            ChatItem(
              imageUrl: "https://picsum.photos/id/1/200/300",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            ),
            ChatItem(
              imageUrl: "https://picsum.photos/id/2/200/300",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            ),
            ChatItem(
              imageUrl: "https://picsum.photos/id/3/200/300",
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ChatItem({this.imageUrl, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text("09.00 PM"),
    );
  }
}
