import 'package:shopex/cart/paybottom.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CartPaymentScreen extends StatefulWidget {
  final dynamic totelPrice;
  final int index;
  const CartPaymentScreen({
    super.key,
    required this.index,
    required this.totelPrice,
  });

  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  String method = 'val';
  int currentIndex = 0;
  final _couponController = TextEditingController();
  CarouselController carouselController = CarouselController();
  String groupValue = 'Yes';
  bool? allow = false;
  List imagelist = [
    {'id': 1, 'imagepath': 'images/upi.jpeg'}, // Update with file path
    {'id': 2, 'imagepath': 'images/phonepe.jpeg'}, // Update with file path
    {'id': 3, 'imagepath': 'images/paytm.jpeg'}, // Update with file path
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const Divider(thickness: 3),
          ListTile(
            leading: Radio(
                value: 'Now',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('UPI'),
            trailing: const SizedBox(
                width: 100,
                child: Image(image: AssetImage('images/paytm.jpeg'))),
          ),
          ListTile(
            leading: Radio(
                value: 'Now',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Wallets'),
            trailing: const SizedBox(
                width: 100,
                child: Image(image: AssetImage('images/phonepe.jpeg'))),
          ),
          ListTile(
            leading: Radio(
                value: 'Now1',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Credit/Debit/ATM Card'),
            subtitle:
                const Text('Add and secure your card as per RBI quidelines'),
          ),
          ListTile(
            leading: Radio(
                value: 'Now2',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Net Banking'),
            subtitle: const Text(
                'This instrument has low success,use UPI or cards for better experience'),
          ),
          ListTile(
            leading: Radio(
                value: 'Now3',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Cash on Delivery'),
          ),
          const Divider(thickness: 5),

          const Divider(thickness: 10),
          // CartPayDelCard(widget: widget, allow: allow),
          CartPaymBottom(allow: allow, widget: widget, groupValue: groupValue),
        ],
      ),
    );
  }
}
