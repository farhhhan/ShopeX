import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customecart.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';

class admin_orderdetials extends StatefulWidget {
  admin_orderdetials(
      {required this.imgs,
      required this.name,
      required this.color,
      required this.qnty,
      required this.rate,
      required this.usern,
      required this.mail,
      required this.address,
      required this.city,
      required this.pin,
      super.key});
  final imgs;
  final String name;
  final color;
  final qnty;
  final rate;
  final usern;
  final mail;
  final address;
  final pin;
  final city;
  @override
  State<admin_orderdetials> createState() => _OrderfillscreenState();
}

class _OrderfillscreenState extends State<admin_orderdetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: customeText(
          texts: 'Order',
          textcolor: Colors.white,
          textsize: 26,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          customecart(
              imagepath: widget.imgs,
              pdnames: widget.name,
              colorss: widget.color,
              qnty: widget.qnty,
              pdprice: widget.rate),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeText(texts: 'item tottal'),
                customeText(
                  texts: widget.rate,
                  textcolor: Colors.green,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeText(
                  texts: 'Delivery fee',
                ),
                customeText(
                  texts: 'Free',
                  textcolor: Colors.green,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeText(
                  texts: 'Grand Total',
                  textweight: FontWeight.w700,
                ),
                customeText(
                  texts: widget.rate,
                  textcolor: Colors.green,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                customeText(texts: 'Name: '),
                SizedBox(
                  width: 20,
                ),
                customeText(texts: widget.usern)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                customeText(texts: 'Mail: '),
                SizedBox(
                  width: 20,
                ),
                customeText(texts: widget.mail)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeText(texts: 'address:'),
                Card(
                  elevation: 15,
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Center(child: customeText(texts: widget.address))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customeText(
                      texts: 'City: ${widget.city}',
                    ),
                    customeText(texts: 'pin Code: ${widget.pin}')
                  ],
                ),
                Divider(),
                customeText(texts: 'Payment methode:'),
                Card(
                  child: ListTile(
                    title: customeText(texts: 'Cash On Delivery'),
                    trailing: customeicon(Iconss: Icons.expand_more),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
