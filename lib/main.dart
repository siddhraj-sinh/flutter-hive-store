import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_store/models/user.dart';
import 'package:hive_store/screens/home.dart';
import 'package:hive_store/services/user_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Hive
  await Hive.initFlutter();

  //Initialize services
  UserService userService = UserService();

  await userService.init();

  runApp(MultiProvider(
    providers: [Provider<UserService>.value(value: userService)],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: false),
      home: HomeScreen(),
    );
  }
}
