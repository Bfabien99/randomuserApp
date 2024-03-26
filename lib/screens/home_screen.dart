import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("User API"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
          child: Icon(Icons.crisis_alert),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final color = user.gender == 'male' ? Colors.white : Colors.grey[100];

              return Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: ListTile(
                  tileColor: color,
                  leading: ClipRRect(
                    child: Image.network(user.picture),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  title: Text('${user.name.title}. ${user.name.lastname} ${user.name.firstname}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender : ${user.gender}'),
                      Text('Email : ${user.email}'),
                      Text('Phone : ${user.phone}'),
                      Text('Cell : ${user.cell}'),
                      Text('Nat : ${user.nat}'),
                    ],
                  ),
                ),
              );
            }));
  }

  void fetchUsers() async {
    print("fetchUsers called...");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    //print(json);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        firstname: e['name']['first'],
        lastname: e['name']['last'],
      );
      return User(
        gender: e['gender'],
        name : name,
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        picture: e['picture']['thumbnail'],
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    print("fetchUsers completed!");
  }
}
