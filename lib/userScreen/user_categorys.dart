import 'dart:io';

import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/userScreen/Detialsscreen.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryScreens extends StatefulWidget {
  CategoryScreens({required this.category, Key? key}) : super(key: key);
  String category;
  Color colorss = Colors.white;
  @override
  State<CategoryScreens> createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: widget.category.toUpperCase(),
          textcolor: Colors.white,
          textsize: 26,
          textspace: 2.6,
          textweight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (context, List<Product> adminlist, Widget? child) {
          final filteredList = adminlist
              .where((product) => product.category == widget.category)
              .toList();
          if (filteredList.isEmpty) {
            return Center(child: customeText(texts: 'No Datas'));
          } else {
            return GridView.builder(
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3, crossAxisCount: 2),
              itemBuilder: (context, index) {
                final product = filteredList[index];
                final imgPath = product.image; // Updated image path as a String
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          showDatas(
                            product.name,
                            imgPath,
                            product.description,
                            product.price,
                            product.category,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 200,
                                    child: Image.file(File(
                                        imgPath)), // Display image using AssetImage
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
                                        setState(() {
                                          if (widget.colorss == Colors.white) {
                                            widget.colorss = Colors.red;
                                          } else {
                                            widget.colorss = Colors.white;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.favorite),
                                      iconSize: 35,
                                      color: widget.colorss,
                                    ),
                                  ),
                                ],
                              ),
                              customeText(
                                texts: product.name,
                                textsize: 16,
                                textfam: 'Inter',
                                textweight: FontWeight.w800,
                                textspace: 1.60,
                              ),
                              customeText(
                                texts: '\$ ${product.price}',
                                textcolor: Colors.black,
                                textsize: 16,
                                textfam: 'Inter',
                                textweight: FontWeight.w300,
                                textspace: 1.60,
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void showDatas(String name, String imagepath, String discrp, String price,
      String colorss) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => productdetials(
          pdname: name,
          imagesp: imagepath, // Pass the updated image path as a String
          rate: price,
          color: colorss,
          discriptions: discrp,
        ),
      ),
    );
  }
}
