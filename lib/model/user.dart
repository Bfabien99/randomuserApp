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
}

class UserName{
    final String title;
  final String firstname;
  final String lastname;

  UserName({
    required this.title,
      required this.firstname,
      required this.lastname,
  });
}