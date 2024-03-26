import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_api/model/user.dart';

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
      return User.fromMap(e);
    }).toList();
    return users;
  }

}