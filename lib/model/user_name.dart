class UserName{
    final String title;
  final String firstname;
  final String lastname;

  UserName({
    required this.title,
      required this.firstname,
      required this.lastname,
  });

  factory UserName.fromMap(Map<String, dynamic> e){
    return UserName(
        title: e['name']['title'],
        firstname: e['name']['first'],
        lastname: e['name']['last'],
      );
  }
}