import 'package:shopex/orderfull/order.dart';
import 'package:shopex/userScreen/homescreen.dart';
import 'package:shopex/userScreen/succescreen.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class paymentscreen extends StatefulWidget {
  paymentscreen(
      {required this.images,
      required this.name,
      required this.price,
      required this.cate,
      required this.count,
      this.address,
      this.city,
      this.pin,
      this.user,
      this.numb,
      super.key});

  final images;
  final name;
  final cate;
  final price;
  final count;
  final String? address;
  final String? city;
  final String? pin;
  final String? user;
  final String? numb;

  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  List imagelist = [
    {'id': 1, 'imagepath': 'images/upi.jpeg'}, // Update with file path
    {'id': 2, 'imagepath': 'images/phonepe.jpeg'}, // Update with file path
    {'id': 3, 'imagepath': 'images/paytm.jpeg'}, // Update with file path
  ];
  List imagelist2 = [
    {'id': 1, 'imagepath': 'images/paytm.jpeg'}, // Update with file path
    {'id': 2, 'imagepath': 'images/phonepe.jpeg'}, // Update with file path
  ];
  String method = '';
  @override
  Widget build(BuildContext context) {
    double prices = double.parse(widget.price);
    num payble = prices + 49;
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: 'Payment',
          textsize: 26,
          textcolor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 620,
            width: double.infinity,
            child: ListView(
              children: [
                Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        child: Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 22,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Center(
                                      child: FaIcon(FontAwesomeIcons.check)),
                                ),
                              ),
                              Container(
                                height: 2,
                                width: 100,
                                color: Colors.blue,
                              ),
                              CircleAvatar(
                                maxRadius: 22,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Center(
                                      child: FaIcon(FontAwesomeIcons.check)),
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
                                    texts: '3',
                                    textcolor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          value: 'UPI',
                          groupValue: method,
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customeText(texts: 'UPI'),
                              CarouselSlider(
                                carouselController: carouselController,
                                items: imagelist
                                    .map((item) => Image.asset(
                                          item['imagepath'],
                                          fit: BoxFit.contain,
                                          width: 60,
                                          height: 20,
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 1.5,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    currentIndex = index;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          value: 'wallet',
                          groupValue: method,
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customeText(texts: 'Wallet / Postpaid'),
                              CarouselSlider(
                                carouselController: carouselController,
                                items: imagelist2
                                    .map((item) => Image.asset(
                                          item['imagepath'],
                                          fit: BoxFit.contain,
                                          width: 60,
                                          height: 10,
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 1.5,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    currentIndex = index;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          selected: true,
                          groupValue: method,
                          value: 'ATM Card',
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customeText(texts: 'Credit / Debit / ATM Card'),
                              customeText(
                                  textcolor: Colors.black45,
                                  textsize: 14,
                                  texts:
                                      '''Add and secure your card as per RBI guidence''')
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          selected: true,
                          groupValue: method,
                          value: 'Net banking',
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customeText(texts: 'Net Banking'),
                              customeText(
                                  textcolor: Colors.black45,
                                  textsize: 14,
                                  texts:
                                      '''This instrument has low succes,use UPI or Card for better experince''')
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          selected: true,
                          groupValue: method,
                          value: 'Credit / Debit / ATM Card',
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: customeText(texts: 'EMI (Easy Instalment)'),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: RadioListTile(
                          selected: true,
                          groupValue: method,
                          value: 'ready',
                          onChanged: (value) {
                            setState(() {
                              method = value!;
                            });
                          },
                          title: customeText(texts: 'Cash On Delivery'),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 1
                      //       child: Image.asset('images/RuPay-Logo.png'))
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: customeText(
                          texts: 'PRICE  DETAILS',
                          textcolor: Colors.black45,
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeText(texts: 'Price '),
                            customeText(texts: '₹${widget.price}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeText(texts: 'Delivery Charges '),
                            customeText(
                              texts: 'Free',
                              textcolor: Colors.green,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeText(texts: 'Package Charges '),
                            customeText(
                              texts: '₹49.00',
                              textcolor: Colors.black,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customeText(texts: 'Amount payable'),
                            customeText(
                              texts: '₹${payble}',
                              textcolor: Colors.black,
                              textweight: FontWeight.w600,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customeText(
                    texts: payble.toString(),
                    textsize: 25,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(227, 255, 191, 0))),
                        onPressed: () {
                          paymentalert(context, payble);
                        },
                        child: customeText(texts: 'Order')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void paymentalert(BuildContext context, num payment) {
    if (method == 'ready') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => success(),
          ));
      final orderBox = Hive.box<Order>('order');
      orderBox.add(
        Order(
          name: widget.name,
          image: widget.images,
          price: payment.toString(),
          category: widget.cate,
          id: -1,
          qnty: widget.count,
          address: widget.address,
          city: widget.city,
          number: widget.numb,
          pincode: widget.pin,
          usrname: widget.user,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: customeText(texts: 'Payment status'),
            content: customeText(texts: 'Your Bank network not connected'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: customeText(texts: 'Check connection'))
            ],
          );
        },
      );
    }
  }
}
