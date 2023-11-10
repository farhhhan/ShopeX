import 'package:hive/hive.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
class Order {
  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  @HiveField(2)
  String price;

  @HiveField(3)
  String image;

  @HiveField(4)
  String qnty;

  @HiveField(5)
  String? address;

  @HiveField(6)
  String? city;

  @HiveField(7)
  String? pincode;

  @HiveField(8)
  int id;

  @HiveField(9)
  String? number;

  @HiveField(10)
  String? usrname;

  Order({
    required this.name,
    required this.category,
    required this.image,
    this.address,
    required this.qnty,
    this.city,
    required this.id,
    this.number,
    this.pincode,
    required this.price,
    this.usrname,
  });
}
