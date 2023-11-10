import 'package:shopex/adminScreen/admin_home.dart';
import 'package:shopex/adminScreen/admin_orderlist.dart';
import 'package:shopex/adminScreen/admin_userlist.dart';
import 'package:shopex/orderfull/order.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class admin_main extends StatefulWidget {
  const admin_main({super.key});

  @override
  State<admin_main> createState() => _MyAppState();
}

class _MyAppState extends State<admin_main> {
  late Box<Order> orderBox = Hive.box<Order>('order');

  // orderHelper ordh = orderHelper();
  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    orderBox = await Hive.openBox('order');
  }

  var indx = 0;
  List Screen = [admin_home(), admin_orderlist(), admin_users()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.green,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            showSelectedLabels: true,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "UserList",
              ),
            ],
            currentIndex: indx,
            onTap: (int index) {
              setState(() {
                indx = index;
              });
            },
          ),
          body: Screen.elementAt(indx)),
    );
  }
}
