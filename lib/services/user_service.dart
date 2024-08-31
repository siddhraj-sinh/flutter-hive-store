import 'hive_service.dart';
import  'package:hive_store/models/user.dart';
import 'package:hive/hive.dart';

class UserService {
  final HiveService<User> _hiveService = HiveService<User>('userBox');

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    await _hiveService.openBox();
  }

  Future<void> saveUser(User user) async {
    await _hiveService.saveData('user', user);
  }

  User? loadUser() {
    return _hiveService.loadData('user');
  }

  Future<void> deleteUser() async {
    await _hiveService.deleteData('user');
  }

  Future<void> clearAllUsers() async {
    await _hiveService.clearBox();
  }
}
