import 'package:shopex/address/address.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Address>> addresslist = ValueNotifier([]);

class addressHelper {
  Future<void> delete(int id) async {
    final remove = await Hive.openBox<Address>('address');
    remove.delete(id);
    getalladress();
  }

  Future<void> save(Address value) async {
    final save = await Hive.openBox<Address>('address');
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Address(
          name: data!.name,
          address: data.address,
          city: data.city,
          pincode: data.pincode,
          id: id,
          number: data.number,
          usrname: data.usrname),
    );
    getalladress();
  }

  Future<void> getalladress() async {
    final save = await Hive.openBox<Address>('address');
    addresslist.value.clear();
    addresslist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    addresslist.notifyListeners();
  }
}
