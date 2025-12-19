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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("test"), backgroundColor: Colors.blue),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) =>
              //이런걸 함수라고 안부르고 커스텀 위젯이라고 하는구나.
              //React로 치면 함수 컴포넌트인데 플러터에서는 커스텀 위젯이라고 함
              //! 이거 붙인게 널값이 아니다라는걸 증명해준거임 ㅇㅇ 내가
              //이렇게 쓰기 싫다? 그러면 ?? 이거 붙여주면됨
              UserListTitle(name: users[index]["name"]!),
          //이런식으로
          //   UserListTitle(name: users[index]["name"]??"이름없음"),
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

//StatelessWidget니까 final String name 이다?? 맞음??
//-> 문법적으로 필수는 아닌데 걍 관례임 걍 쓰셈 스테이트레스일때 걍 쓰는거임
class UserListTitle extends StatelessWidget {
  final String name;

  // UserListTitle(name: users[index]["name"]!),
  //그럼 만약 name 이랑 age 까지 받아야한다면?? required this,name this.age
  //이런식으로 하는건가?
  const UserListTitle({super.key, required this.name});
  //예시 코드
  //   class UserListTitle extends StatelessWidget {
  //   final String name;
  //   final int age;

  //   const UserListTitle({
  //     super.key,
  //     required this.name,
  //     required this.age,
  //   });
  // }

  //근데 순서가 좀 이상해. 그럼 생성자 먼저 해주고 그러고 그 밑에서
  //파이널 해줘야하는거 아니가?

  //생성자를 먼저 할 수 없는게 -> 선언 먼저하고 그러고 생성자로 초기화 해주는거임
  //그러고 메서드 나오는거고 ㅇㅇㅇㅇㅇㅇ

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
