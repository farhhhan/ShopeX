import 'package:hive_flutter/hive_flutter.dart';

part 'wish.g.dart';

@HiveType(typeId: 5)
class wishlist {
  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? id;

  @HiveField(4)
  String? cate;

  @HiveField(5)
  String? disc;

  wishlist(
      {required this.name,
      required this.image,
      required this.price,
      required this.cate,
      required this.disc,
      this.id});
}
