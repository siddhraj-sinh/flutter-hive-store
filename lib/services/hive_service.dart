import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String boxName;

  HiveService(this.boxName);

  Future<void> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  Box<T> _getBox() => Hive.box<T>(boxName);

  Future<void> saveData(String key, T data) async {
    final box = _getBox();
    await box.put(key, data);
  }

  T? loadData(String key) {
    final box = _getBox();
    return box.get(key);
  }

  Future<void> deleteData(String key) async {
    final box = _getBox();
    await box.delete(key);
  }

  Future<void> clearBox() async {
    final box = _getBox();
    await box.clear();
  }
}
