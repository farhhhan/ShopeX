import 'package:hive_flutter/adapters.dart';
part 'order_cart.g.dart';

@HiveType(typeId: 6)
class OrderhistoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String title;
  @HiveField(3)
  num price;

  @HiveField(4)
  String cate;

  @HiveField(5)
  double? qnty;

  @HiveField(6)
  String? address;

  @HiveField(7)
  String? city;

  @HiveField(8)
  String? pincode;

  @HiveField(9)
  String? number;

  @HiveField(10)
  String? usrname;

  OrderhistoryModel(
      {required this.address,
      required this.city,
      required this.number,
      required this.pincode,
      required this.usrname,
      required this.image,
      required this.title,
      required this.price,
      this.id,
      required this.qnty,
      required this.cate});
}
