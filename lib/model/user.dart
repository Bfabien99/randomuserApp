import 'package:user_api/model/user_name.dart';

class User {
  final String gender;
  UserName name;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final String picture;

  User(
      {required this.gender,
      required this.name,
      required this.phone,
      required this.email,
      required this.cell,
      required this.nat,
      required this.picture}
      );
    
    factory User.fromMap(Map<String, dynamic> e){
      final name = UserName.fromMap(e);
        return User(
        gender: e['gender'],
        name : name,
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        picture: e['picture']['thumbnail'],
      );
    }

  String get fullname{
    return '${name.title} ${name.firstname} ${name.lastname}';
  }
}