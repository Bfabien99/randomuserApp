import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User API"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers, child: Icon(Icons.crisis_alert),),
      body: ListView.builder(itemCount: users.length,itemBuilder: (context, index){
        final user = users[index];
        final email = user['email'];
        final gender = user['gender'];
        final name = user['name']['title']+' '+user['name']['last']+' '+user['name']['first'];
        final imgURL = user['picture']['thumbnail'];
        return ListTile(
          leading: ClipRRect(child: Image.network(imgURL), borderRadius: BorderRadius.circular(100),),
          title: Text(name),
          subtitle: Row(children: [Text('$gender - '), Flexible(child: Text(email))],),
        );
      })
    );
  }

  void fetchUsers() async{
    print("fetchUsers called...");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    var json = jsonDecode(body);
    //print(json);
    setState(() {
      users = json['results'];
    });
    print("fetchUsers completed!");
  }
}