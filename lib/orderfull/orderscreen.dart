import 'package:shopex/orderfull/order.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/userScreen/cancelscreen.dart';
import 'package:shopex/userScreen/orderDetials.dart';

import 'package:shopex/widgets/customecart.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class orderscreen extends StatefulWidget {
  orderscreen({super.key});

  @override
  State<orderscreen> createState() => _orderscreenState();
}

class _orderscreenState extends State<orderscreen> {
  @override
  void initState() {
    super.initState();
    _openBox();
  }

  late Box<Order> orderBox = Hive.box<Order>('order');
  Future<void> _openBox() async {
    orderBox = await Hive.openBox<Order>('order');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: customeText(
              texts: 'Order',
              textsize: 26,
              textcolor: Colors.white,
            ),
            centerTitle: true,
          ),
          body: ValueListenableBuilder<Box<Order>>(
            valueListenable: orderBox.listenable(),
            builder: (context, orderBox, _) {
              final order = orderBox.values.toList();
              if (order.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset('images/empty.gif')),
                    customeText(
                      texts: 'No Order Found',
                      textsize: 26,
                      textweight: FontWeight.w800,
                    )
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: orderBox.length,
                  itemBuilder: (context, index) {
                    final value = order[index];
                    return Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            customecart(
                                imagepath: value.image,
                                pdnames: value.name,
                                colorss: value.category,
                                qnty: value.qnty,
                                pdprice: value.price),
                            Divider(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 190,
                                  child: ListTile(
                                    leading: customeicon(
                                        Iconss: Icons.cancel,
                                        colorss: Colors.blue),
                                    onTap: () {
                                      setState(() {});
                                      print(index);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                cancelscreen(id: index),
                                          ));
                                    },
                                    title: customeText(texts: 'Cancelation'),
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 10,
                                ),
                                Container(
                                  width: 160,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => orderinfo(
                                                imgs: value.image,
                                                name: value.name,
                                                color: value.category,
                                                qnty: value.qnty,
                                                rate: value.price,
                                                usern: value.usrname,
                                                mail: value.number,
                                                address: value.address,
                                                city: value.city,
                                                pin: value.pincode),
                                          ));
                                    },
                                    leading: customeicon(
                                      Iconss: Icons.details,
                                      colorss: Colors.red,
                                    ),
                                    title: customeText(texts: 'Detials'),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
