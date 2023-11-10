import 'dart:io';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/userScreen/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class addfillscreen extends StatefulWidget {
  addfillscreen({
    required this.imagePath, // Pass imagePath as a String
    required this.name,
    required this.price,
    required this.cate,
    required this.count,
    required this.address,
    required this.city,
    required this.pin,
    required this.user,
    required this.numb,
    Key? key,
  }) : super(key: key);

  final imagePath; // Image path as a String
  final String name;
  final String cate;
  final String price;
  final String count;
  final String address;
  final String city;
  final String pin;
  final String user;
  final String numb;

  @override
  _addfillscreenState createState() => _addfillscreenState();
}

class _addfillscreenState extends State<addfillscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: 'Order Summery',
          textsize: 26,
          textcolor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    maxRadius: 20.5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(child: FaIcon(FontAwesomeIcons.check)),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.blue,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: customeText(
                        texts: '2',
                        textcolor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.black54,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: customeText(
                        texts: '3',
                        textcolor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Container(
                        width: 102,
                        height: 104,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: FileImage(File(widget
                                .imagePath!)), // Display image using AssetImage
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(
                        texts: widget.name,
                        textweight: FontWeight.w800,
                        textspace: 1.60,
                      ),
                      customeText(
                        texts: 'Category: ${widget.cate}',
                        textcolor: Color(0xFF5E5C5C),
                        textsize: 16,
                        textweight: FontWeight.w800,
                        textspace: 1.60,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customeText(
                            texts: 'Qty:  ${widget.count}',
                            textsize: 16,
                            textweight: FontWeight.w800,
                            textspace: 1.60,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          customeText(
                            textcolor: Colors.green,
                            texts: '₹${widget.price}',
                            textsize: 16,
                            textweight: FontWeight.w700,
                            textspace: 1.60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeText(texts: 'Item total'),
                customeText(
                  texts: '₹${widget.price}',
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
                  texts: '₹${widget.price}',
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
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Row(
              children: [
                customeText(texts: 'Name: '),
                SizedBox(
                  width: 20,
                ),
                customeText(texts: '${widget.user}')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              children: [
                customeText(texts: 'Number: '),
                SizedBox(
                  width: 20,
                ),
                customeText(texts: '${widget.numb}')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeText(texts: 'Address:'),
                Card(
                  elevation: 15,
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Center(
                          child: customeText(texts: '${widget.address}'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customeText(
                      texts: 'City: ${widget.city}',
                    ),
                    customeText(texts: 'Pin Code: ${widget.pin}')
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => paymentscreen(
                                  images: widget.imagePath,
                                  name: widget.name,
                                  price: widget.price,
                                  cate: widget.cate,
                                  count: widget.count,
                                  address: widget.address,
                                  city: widget.city,
                                  numb: widget.numb,
                                  pin: widget.pin,
                                  user: widget.user,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: customeText(texts: 'Payment'),
                  ))
            ],
          )
        ],
      ),
    );
  }
  // String sum() {
  //   var c = num.parse(widget.count);
  //   var val = num.parse(widget.price);
  //   var res = c * val;
  //   var result = res.toString();
  //   return result;
  // }
}
