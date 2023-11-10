import 'dart:io';
import 'package:shopex/cart/cart.dart';
import 'package:shopex/cart/cartdbHelper.dart';
import 'package:shopex/cart/carts.dart';
import 'package:shopex/cart/cartscreen.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/userScreen/addressScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class productdetials extends StatefulWidget {
  productdetials(
      {this.imagesp,
      this.pdname,
      required this.rate,
      required this.discriptions,
      this.color,
      super.key});
  final color;
  final String? imagesp;
  final pdname;
  final rate;
  final discriptions;
  @override
  State<productdetials> createState() => _orderdetialsState();
}

class _orderdetialsState extends State<productdetials> {
  carthHelper chelp = carthHelper();

  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: '${widget.pdname}',
          textsize: 26,
          textcolor: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartsmain(),
                    ));
              },
              icon: FaIcon(FontAwesomeIcons.cartShopping))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            image: FileImage(File(widget.imagesp!)),
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
                        texts: widget.pdname,
                        textweight: FontWeight.w800,
                        textspace: 1.60,
                      ),
                      customeText(
                        texts: 'Category: ${widget.color}',
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
                            texts: 'Price:  ₹${widget.rate}',
                            textsize: 16,
                            textcolor: Colors.green,
                            textweight: FontWeight.w800,
                            textspace: 1.60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
                                decrementQuantity();
                              });
                            },
                          ),
                          const SizedBox(width: 2),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                          const SizedBox(width: 2),
                          IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                incrementQuantity();
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  customeText(texts: 'Description'),
                  Center(
                    child: Card(
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: 450,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView(
                            children: [
                              customeText(texts: '${widget.discriptions}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 400,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(58, 175, 169, 1))),
                    onPressed: () {
                      checkCart(widget.pdname, context);
                    },
                    child: customeText(texts: 'Add to Cart')),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(217, 255, 191, 0))),
                    onPressed: () {
                      num val = quantity * int.parse(widget.rate);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addresscreen(
                                    name: widget.pdname,
                                    colorss: widget.color,
                                    count: quantity.toString(),
                                    images: widget.imagesp!,
                                    price: val.toString(),
                                  )));
                    },
                    child: customeText(texts: 'Buy Now')),
              )
            ],
          )
        ],
      ),
    );
  }

  void checkCart(String pdname, BuildContext context) async {
    await Hive.openBox<Cart>('cart'); // Open the Hive box for cart

    final cartBox = Hive.box<Cart>('cart');

    final cartExists = cartBox.values.any((user) => user.name == pdname);
    if (cartExists) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('All Ready product in Cart'),
        backgroundColor: Colors.red,
      ));
    } else {
      final carts = Cart(
          name: widget.pdname,
          image: widget.imagesp,
          price: widget.rate,
          quantity: quantity.toDouble(),
          cate: widget.color);
      chelp.save(carts);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Add In Cart Succesfully'),
        backgroundColor: Colors.green,
      ));
    }
  }
}
