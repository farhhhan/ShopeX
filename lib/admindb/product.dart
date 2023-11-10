import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  @HiveField(2)
  String price;

  @HiveField(3)
  String image;

  @HiveField(4)
  String description;

  @HiveField(5)
  int id;


  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.id,
  });
}
