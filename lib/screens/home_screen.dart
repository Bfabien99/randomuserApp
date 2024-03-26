import 'package:flutter/material.dart';
import 'package:user_api/model/user.dart';
import 'package:user_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("User API"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final color = user.gender == 'male' ? Colors.white : Colors.grey[100];

              return Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: ListTile(
                  tileColor: color,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.picture),
                  ),
                  title: Text(user.fullname),
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

  // Appel de l'api pour obtenir les utilisateurs
  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
