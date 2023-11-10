import 'package:shopex/cart/cartorder.dart';
import 'package:shopex/cart/cartscreen.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class cartsmain extends StatefulWidget {
  cartsmain({this.name, super.key});
  final name;

  @override
  State<cartsmain> createState() => _cartsmainState();
}

class _cartsmainState extends State<cartsmain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: customeText(
              texts: 'Cart',
              textsize: 26,
              textcolor: Colors.white,
            ),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(child: FaIcon(FontAwesomeIcons.cartPlus)
                  //      customeText(
                  //   texts: 'home',
                  //   textsize: 20,
                  //   textspace: 1,
                  // )
                  ),
              Tab(child: FaIcon(FontAwesomeIcons.bagShopping)
                  //     customeText(
                  //   texts: 'category',
                  //   textsize: 20,
                  //   textspace: 1,
                  // )
                  )
            ]),
          ),
          body: TabBarView(children: [cartscreens(), orderhistory()]),
        ));
  }
}
