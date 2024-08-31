import 'package:flutter/material.dart';
import 'package:hive_store/models/user.dart';
import 'package:hive_store/screens/add_user.dart';
import 'package:hive_store/services/user_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user; // Nullable User variable

  @override
  void initState() {
    super.initState();
    user = _loadUserData(); // Initialize the user data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive User Store'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddUserPage,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: user == null
            ? Text('No user data available') // Fallback UI when user is null
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user!.name}'), // Display user's name
            Text('Age: ${user!.age}'),   // Display user's age
          ],
        ),
      ),
    );
  }

  Future<void> navigateToAddUserPage() async {
    final route = MaterialPageRoute(builder: (context) => AddUserScreen());
    await Navigator.push(context, route);
    setState(() {
     user = _loadUserData();
    });
  }

  User? _loadUserData() {
    final userService = Provider.of<UserService>(context, listen: false);
    return userService.loadUser(); // Return User or null
  }
}
