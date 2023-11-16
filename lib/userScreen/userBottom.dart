import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shopex/cart/carts.dart';
import 'package:shopex/main.dart';
import 'package:shopex/orderfull/order.dart';
import 'package:shopex/orderfull/orderscreen.dart';
import 'package:shopex/userScreen/accountscreen.dart';

class MyBottam extends StatefulWidget {
  MyBottam({super.key});

  @override
  State<MyBottam> createState() => _MyAppState();
}

class _MyAppState extends State<MyBottam> {
  late Box<Order> orderBox = Hive.box<Order>('order');
  String? val = 'one';
  var indx = 0;
  List Screen = [homeScreen(), orderscreen(), cartsmain(), accountscreen()];

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    orderBox = await Hive.openBox<Order>('order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: FaIcon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.listUl),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartArrowDown),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        currentIndex: indx,
        onTap: (int index) {
          setState(() {
            indx = index;
          });
        },
      ),
      body: Screen.elementAt(indx),
    );
  }
}
