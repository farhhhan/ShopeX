import 'package:shopex/cart/cart.dart';
import 'package:shopex/cart/cartaddress.dart';
import 'package:shopex/cart/cartdbHelper.dart';
import 'package:shopex/userScreen/addressscreen.dart';
import 'package:shopex/widgets/customecart.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';


carthHelper chelp = carthHelper();
late double totals;

class cartscreens extends StatefulWidget {
  const cartscreens({super.key});

  @override
  State<cartscreens> createState() => _cartscreensState();
}

class _cartscreensState extends State<cartscreens> {
  @override
  void initState() {
    super.initState();
    chelp.getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: cartlist,
              builder: (context, List<Cart> cartist, Widget? child) {
                return ListView.builder(
                  itemCount: cartist.isEmpty ? 1 : cartist.length,
                  itemBuilder: (context, index) {
                    if (cartist.isEmpty) {
                      return Column(
                        children: [
                          Center(
                              child: Container(
                            width: double.infinity,
                            height: 550,
                            child: Image.asset(
                              'images/empty_cart2.gif',
                              fit: BoxFit.cover,
                            ),
                          )),
                        ],
                      );
                    }
                    final Cart = cartist[index];
                    return Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customecart(
                                imagepath: Cart.image,
                                pdnames: Cart.name,
                                colorss: Cart.cate,
                                pdprice: Cart.price,
                                qnty: Cart.quantity.toString(),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 110,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              countLessing(
                                                idd: Cart.id,
                                                imagee: Cart.image,
                                                pricee: int.parse(Cart.price),
                                                quantityy: Cart.quantity,
                                                titlee: Cart.name,
                                                cate: Cart.cate,
                                              );
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          qunditys(Cart.quantity!).toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 2),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              countAdding(
                                                idd: Cart.id,
                                                imagee: Cart.image,
                                                pricee: int.parse(Cart.price),
                                                quantityy: Cart.quantity,
                                                titlee: Cart.name,
                                                cate: Cart.cate,
                                              );
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  customeText(
                                    textcolor: Colors.green,
                                    texts: '₹${Cart.price}',
                                    textsize: 16,
                                    textweight: FontWeight.w700,
                                    textspace: 1.60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 190,
                                child: ListTile(
                                  leading: customeicon(
                                      Iconss: Icons.delete,
                                      colorss: Colors.blue),
                                  onTap: () {
                                    setState(() {
                                      chelp.delete(Cart.id!);
                                    });
                                  },
                                  title: customeText(texts: 'Delete'),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 10,
                              ),
                              Container(
                                width: 160,
                                child: ListTile(
                                  onTap: () {
                                    num val = qunditys(Cart.quantity!) *
                                        int.parse(Cart.price);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => addresscreen(
                                                name: Cart.name,
                                                colorss: Cart.cate,
                                                images: Cart.image,
                                                price: val.toString(),
                                                count: Cart.quantity)));
                                  },
                                  leading: customeicon(
                                    Iconss: Icons.shop_2,
                                    colorss: Colors.red,
                                  ),
                                  title: customeText(texts: 'Buy Now'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customeText(
                    texts: 'Total Price: ',
                    textcolor: Colors.blue,
                    textspace: 1.6,
                  ),
                  ValueListenableBuilder(
                    valueListenable: cartlist,
                    builder: (context, List<Cart> cartlist2, Widget? child) {
                      final Carts = cartlist2.toList();
                      double totalPrice = 0.0;
                      for (var item in Carts) {
                        final price = double.parse(item.price);
                        final qnty = item.quantity;

                        totalPrice += price * qnty!;
                        totals = totalPrice;
                      }
                      return customeText(
                        texts: '₹${totalPrice.toStringAsFixed(2)}',
                        textcolor: Colors.green,
                        textsize: 18,
                        textspace: 1,
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (totals > 0 && cartlist.value.isNotEmpty)
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => CartPaymentScreen(
                        //     index: 0,
                        //     totelPrice: totals,
                        //   ),
                        // ));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => cartAddress(
                                  index: 0,
                                  totelPrice: totals,
                                )));
                    },
                    child: customeText(texts: 'Place Order'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 238, 215, 99))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int qunditys(double qunditys) {
    int? qnty = qunditys.toInt();
    return qnty;
  }

  Future<void> countLessing(
      {quantityy, pricee, titlee, imagee, idd, cate}) async {
    int id = idd ?? 0;
    double quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (quantity > 1) {
      quantity = quantity - 1;

      final cart = Cart(
        cate: cate,
        id: id,
        quantity: quantity.toDouble(),
        name: title,
        price: price.toString(),
        image: image,
      );
      await chelp.upgradecart(id, cart);
    }
  }

  Future<void> countAdding(
      {quantityy, pricee, titlee, imagee, idd, cate}) async {
    int id = idd ?? 0;
    double quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (quantity < 9) {
      quantity = quantity + 1;

      final cart = Cart(
        cate: cate,
        id: id,
        quantity: quantity.toDouble(),
        name: title,
        price: price.toString(),
        image: image,
      );
      await chelp.upgradecart(id, cart);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product out of stock'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
