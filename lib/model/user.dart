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

  String get fullname{
    return '${name.title} ${name.firstname} ${name.lastname}';
  }
}