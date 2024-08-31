import 'package:hive/hive.dart';

part 'user.g.dart'; // This part file will be generated later

@HiveType(typeId: 0) // `typeId` is used to identify the type. Must be unique across all Hive models.
class User extends HiveObject {
  @HiveField(0) // Field number in the serialized data. Must be unique within this class.
  final String name;

  @HiveField(1)
  final int age;

  User({required this.name, required this.age});
}
