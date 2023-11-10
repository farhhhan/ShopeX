// import 'package:shopex/orderfull/order.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// ValueNotifier<List<Order>> orderslist = ValueNotifier([]);

// class orderHelper {
//   Future<void> delete(int id) async {
//     final remove = await Hive.openBox<Order>('order');
//     remove.delete(id);
//     getallorder();
//   }

//   Future<void> save(Order value) async {
//     final save = await Hive.openBox<Order>('order');
//     final id = await save.add(value);
//     final data = save.get(id);
//     await save.put(
//       id,
//       Order(
//           name: data!.name,
//           category: data.category,
//           image: data.image,
//           address: data.address,
//           qnty: data.qnty,
//           city: data.city,
//           id: data.id,
//           number: data.number,
//           pincode: data.pincode,
//           price: data.price,
//           usrname: data.usrname),
//     );
//     getallorder();
//   }

//   Future<void> getallorder() async {
//     final save = await Hive.openBox<Order>('order');
//     orderslist.value.clear();
//     orderslist.value.addAll(save.values);
//     // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//     orderslist.notifyListeners();
//   }
// }
