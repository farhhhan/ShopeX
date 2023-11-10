import 'package:shopex/cart/cart.dart';
import 'package:shopex/cart/cartdbHelper.dart';
import 'package:shopex/cart/cartorderfun.dart';
import 'package:shopex/cart/order_cart.dart';
import 'package:shopex/cart/paymentss.dart';
import 'package:shopex/userScreen/succescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartPaymBottom extends StatelessWidget {
  const CartPaymBottom({
    super.key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  });

  final bool? allow;
  final CartPaymentScreen widget;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\₹${widget.totelPrice}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: cartlist,
              builder:
                  (BuildContext context, List<Cart> cartList, Widget? child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () async {
                    if (groupValue == 'Now3') {
                      final cardDb = await Hive.openBox<Cart>('cart');

                      for (var i = 0; i < cardDb.length; i++) {
                        final data = cartList[i];
                        final order = OrderhistoryModel(
                            image: data.image!,
                            title: data.name,
                            price: num.parse(data.price),
                            cate: data.cate!,
                            qnty: data.quantity);
                        orderhistoryy.addOrderHistory(order);
                      }
                      cardDb.clear();

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const success(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
