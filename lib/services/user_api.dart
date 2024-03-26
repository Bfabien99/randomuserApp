import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_api/model/user.dart';
import 'package:user_api/model/user_name.dart';

class UserApi{
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    //print(json);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
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
    return users;
  }

}