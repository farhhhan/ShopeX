import 'package:hive/hive.dart';

part 'userlogin.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String email;

  @HiveField(1)
  String password;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? number;

  User(
      {required this.email,
      required this.password,
      required this.name,
      required this.number});
}
