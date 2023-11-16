import 'dart:io';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/wishlist/wish.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class customeproduct extends StatefulWidget {
  customeproduct({
    this.cate,
    this.disc,
    required this.imageproduct,
    required this.pdname,
    required this.pdprice,
    this.colorss,
    super.key,
  });
  String imageproduct;
  String pdname;
  String pdprice;
  Color? colorss;
  String? cate;
  String? disc;

  @override
  State<customeproduct> createState() => _customeproductState();
}

class _customeproductState extends State<customeproduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 150,
                height: 200,
                child: Image.file(File(widget.imageproduct)),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    final wishBox = Hive.box<wishlist>('wish');
                    final wishExists = wishBox.values
                        .any((wishlists) => wishlists.name == widget.pdname);
                    if (wishExists) {
                      widget.colorss = Colors.red;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('All Ready product in wish'),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      setState(() {
                        widget.colorss = Colors.red;
                      });
                      wishBox.add(
                        wishlist(
                            name: widget.pdname,
                            image: widget.imageproduct,
                            price: widget.pdprice,
                            disc: widget.disc,
                            cate: widget.cate),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Add In WishList'),
                        backgroundColor: Colors.green,
                      ));
                    }
                  },
                  icon: Icon(Icons.favorite),
                  iconSize: 35,
                  color: widget.colorss,
                ),
              ),
            ],
          ),
          customeText(
            texts: widget.pdname,
            textsize: 16,
            textfam: 'Inter',
            textweight: FontWeight.w800,
            textspace: 1.60,
          ),
          customeText(
            texts: '\₹ ${widget.pdprice}',
            textcolor: Colors.black,
            textsize: 16,
            textfam: 'Inter',
            textweight: FontWeight.w300,
            textspace: 1.60,
          ),
        ],
      ),
    );
  }
}
