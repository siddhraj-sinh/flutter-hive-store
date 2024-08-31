import 'package:flutter/material.dart';
import 'package:hive_store/models/user.dart';
import 'package:hive_store/services/user_service.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your username'
              ),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Entre your age',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: _saveUserData, label: Text('Save'),icon: Icon(Icons.add_box),)
          ],
        ),
      ),
    );
  }

  Future<void> _saveUserData() async{
    final userService = Provider.of<UserService>(context, listen: false);

    final name = _nameController.text;
    final age = int.parse(_ageController.text);

    User user = User(name: name,age: age);

    await userService.saveUser(user);

    Navigator.pop(context);

  }

}
