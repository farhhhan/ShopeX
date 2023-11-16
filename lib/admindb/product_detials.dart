import 'dart:io';
import 'package:shopex/admindb/addproduct.dart';
import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/admindb/edit.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  dbhelper dbh = dbhelper();
  @override
  void initState() {
    super.initState();
    dbh.getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: customeText(
          texts: 'Product List',
          textcolor: Colors.white,
          textsize: 26,
          textweight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (context, List<Product> adminlist, Widget? child) {
          return ListView.builder(
            itemCount: adminlist.length,
            itemBuilder: (context, index) {
              final product = adminlist[index];
              final imagePath = product.image;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.red,
                        label: 'Delete',
                        autoClose: true,
                        icon: Icons.delete,
                        onPressed: (context) {
                          dbh.delete(product.id);
                        })
                  ]),
                  endActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Colors.green,
                        label: 'Edit',
                        // ignore: deprecated_member_use
                        icon: FontAwesomeIcons.edit,
                        autoClose: true,
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEditingPage(
                                product: product,
                                index: index,
                                id: product.id,
                              ),
                            ),
                          );
                        })
                  ]),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 149,
                            height: 201,
                            // ignore: unnecessary_null_comparison
                            child: imagePath != null
                                ? Image.file(File(
                                    imagePath)) // Display image from file path
                                : Placeholder(), // Placeholder if no image path is provided
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 62,
                          child: customeText(
                            texts: "Product:${product.name}",
                            textcolor: Colors.black,
                            textsize: 18,
                            textweight: FontWeight.w800,
                            textspace: 1.80,
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 90,
                          child: customeText(
                            texts: "Category:${product.category}",
                            textcolor: Colors.black,
                            textsize: 18,
                            textweight: FontWeight.w800,
                            textspace: 1.80,
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 130,
                          child: customeText(
                            texts: "₹${product.price}",
                            textcolor: Colors.green,
                            textsize: 18,
                            textweight: FontWeight.w800,
                            textspace: 1.80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () {
          _navigateToAddPage();
        },
      ),
    );
  }

  void _navigateToAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductAddingPage()),
    );
  }
}
