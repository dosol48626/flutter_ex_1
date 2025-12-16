import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> users = [
  {"id": "1", "name": "미미미"},
  {"id": "1", "name": "레레레"},
  {"id": "1", "name": "도도도"},
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("test"), backgroundColor: Colors.blue),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) =>
              UserListTitle(name: users[index]["name"]!),
          // UserListTitle(name: users[index]["name"]),
        ),
        // body: ListView(
        //리스트뷰 쓰고 칠드런으로 배열 주는거
        // children: [
        //   UserListTitle(name: "홍길동"),
        //   UserListTitle(name: "임꺽정"),
        //   UserListTitle(name: "도도도"),
        // ],
        // ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 1, thickness: 1, color: Colors.grey.withAlpha(77)),

            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.call),
                  Icon(Icons.message),
                  Icon(Icons.contacts),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserListTitle extends StatelessWidget {
  final String name;

  const UserListTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name),
    );
  }
}
