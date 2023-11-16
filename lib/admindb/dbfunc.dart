import 'package:shopex/admindb/product.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Product>> productlist = ValueNotifier([]);
String dbname = 'dbname';

ValueNotifier<List<User>> userslist = ValueNotifier([]);

class dbhelper {
  Future<void> delete(int id) async {
    final remove = await Hive.openBox<Product>(dbname);
    remove.delete(id);
    getall();
  }

  Future<void> save(Product value) async {
    final save = await Hive.openBox<Product>(dbname);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Product(
        name: data!.name,
        category: data.category,
        price: data.price,
        description: data.description,
        image: data.image,
        id: id,
      ),
    );
    getall();
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Product>(dbname);
    productlist.value.clear();
    productlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    productlist.notifyListeners();
  }
}
