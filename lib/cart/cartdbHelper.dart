import 'package:shopex/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Cart>> cartlist = ValueNotifier([]);

class carthHelper {
  Future<void> delete(int id) async {
    final remove = await Hive.openBox<Cart>('cart');
    remove.delete(id);
    getall();
  }

  Future<void> save(Cart value) async {
    final save = await Hive.openBox<Cart>('cart');
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Cart(
        name: data!.name,
        cate: data.cate,
        price: data.price,
        quantity: data.quantity,
        image: data.image,
        id: id,
      ),
    );
    getall();
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Cart>('cart');
    cartlist.value.clear();
    cartlist.value.addAll(save.values);
    cartlist.notifyListeners();
  }

  Future<void> upgradecart(id, Cart value) async {
    final updateBox = await Hive.openBox<Cart>('cart');
    if (updateBox.containsKey(id)) {
      await updateBox.put(id, value);
      int index = cartlist.value.indexWhere((element) => element.id == id);
      if (index != -1) {
        cartlist.value[index] = value;
        cartlist.notifyListeners();
      }
    }
    value.id = id;
    await updateBox.put(id, value);
  }
}
