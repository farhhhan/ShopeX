import 'dart:io';
import 'package:shopex/cart/cartdbHelper.dart';
import 'package:shopex/cart/cartorderfun.dart';
import 'package:shopex/cart/order_cart.dart';
import 'package:shopex/userScreen/orderDetials.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';


class orderhistory extends StatefulWidget {
  const orderhistory({super.key});

  @override
  State<orderhistory> createState() => _orderhistoryState();
}

int totelPriceShare = 0;

class _orderhistoryState extends State<orderhistory> {
  carthHelper chp = carthHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: orderhistoryNotify,
              builder: (BuildContext context,
                  List<OrderhistoryModel> cartorderlist, Widget? child) {
                if (cartorderlist.isEmpty) {
                  return const Center(
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('images/orderempty1.jpg'),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: cartorderlist.length,
                  itemBuilder: (context, index) {
                    final data = cartorderlist[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ValueListenableBuilder(
                        valueListenable: orderhistoryNotify,
                        builder: (context, box, child) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orderinfo(
                                          imgs: data.image,
                                          name: data.title,
                                          color: data.cate,
                                          qnty: data.qnty.toString(),
                                          rate: data.price.toString(),
                                          usern: data.usrname,
                                          mail: data.number,
                                          address: data.address,
                                          city: data.city,
                                          pin: data.pincode)));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 88,
                                        child: AspectRatio(
                                          aspectRatio: 0.88,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              child: Image(
                                                fit: BoxFit.fill,
                                                image: FileImage(
                                                    File(data.image)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 1),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 15),
                                            customeText(
                                              texts: data.title,
                                              textcolor: Colors.black,
                                              textsize: 22,
                                              textspace: 1.4,
                                              textweight: FontWeight.w600,
                                            ),
                                            Text(
                                              'Category :${data.cate}',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 65, 65),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Quandity :${data.qnty.toString()}',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 65, 65),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Total Price: ₹${totals(data.qnty!, data.price)}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.green,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  ListTile(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: customeText(
                                                texts: 'Order Cancelation',
                                                textsize: 23,
                                                textweight: FontWeight.w600),
                                            content: customeText(
                                                texts:
                                                    'You Want cancel this product'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      cartorderlist
                                                          .removeAt(index);
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: customeText(
                                                      texts: 'Yes')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                      customeText(texts: 'No'))
                                            ],
                                          );
                                        },
                                      );
                                      setState(() {});
                                    },
                                    leading: Icon(Icons.cancel),
                                    title: customeText(
                                      texts: 'Cancelation',
                                      textweight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  void showDailogealert(BuildContext context, String val) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: customeText(
              texts: 'Order Cancelation',
              textsize: 23,
              textweight: FontWeight.w600),
          content: customeText(texts: 'Reason: ${val}'),
          actions: [
            TextButton(onPressed: () {}, child: customeText(texts: 'Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: customeText(texts: 'No'))
          ],
        );
      },
    );
  }

  String totals(double qnty, num price) {
    num val = qnty * price;
    String tot = val.toString();
    return tot;
  }
}
