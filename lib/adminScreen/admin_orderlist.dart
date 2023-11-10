import 'package:shopex/adminScreen/admin_detials.dart';
import 'package:shopex/orderfull/order.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customecart.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class admin_orderlist extends StatefulWidget {
  admin_orderlist({super.key});

  @override
  State<admin_orderlist> createState() => _admin_orderlistState();
}

class _admin_orderlistState extends State<admin_orderlist> {
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: customeText(
              texts: 'Order',
              textsize: 26,
              textcolor: Colors.white,
            ),
            centerTitle: true,
          ),
          body: Scaffold(
              body: ValueListenableBuilder(
            valueListenable: orderBox.listenable(),
            builder: (context, orderBox, _) {
              final orders = orderBox.values.toList();
              if (orders.isEmpty) {
                return Center(
                  child: customeText(
                      texts: 'No Orders', textcolor: Colors.red, textsize: 27),
                );
              } else {
                return ListView.builder(
                  itemCount: orderBox.length,
                  itemBuilder: (context, index) {
                    final ords = orders[index];
                    return Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            customecart(
                                imagepath: ords.image,
                                pdnames: ords.name,
                                colorss: ords.category,
                                qnty: ords.qnty,
                                pdprice: ords.price),
                            Divider(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                            builder: (context) =>
                                                admin_orderdetials(
                                                    imgs: ords.image,
                                                    name: ords.name,
                                                    color: ords.category,
                                                    qnty: ords.qnty,
                                                    rate: ords.price.toString(),
                                                    usern: ords.usrname,
                                                    mail: ords.number,
                                                    address: ords.address,
                                                    city: ords.city,
                                                    pin: ords.pincode),
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
        ));
  }
}
