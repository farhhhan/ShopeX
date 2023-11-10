import 'package:hive_flutter/hive_flutter.dart';

part 'cart.g.dart';

@HiveType(typeId: 4)
class Cart extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(2)
  String? image;

  @HiveField(3)
  double? quantity;

  @HiveField(4)
  int? id;

  @HiveField(5)
  String? cate;

  Cart(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      required this.cate,
      this.id});
}
