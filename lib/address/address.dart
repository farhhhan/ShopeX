import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  @HiveField(2)
  String city;

  @HiveField(3)
  String pincode;

  @HiveField(4)
  int id;

  @HiveField(5)
  String number;

  @HiveField(6)
  String usrname;

  Address({
    required this.name,
    required this.address,
    required this.city,
    required this.pincode,
    required this.id,
    required this.usrname,
    required this.number,
  });
}
