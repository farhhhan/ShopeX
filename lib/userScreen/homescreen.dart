

import 'package:shopex/userScreen/Detialsscreen.dart';

import 'package:shopex/widgets/customeproduct.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/userScreen/searchscreen.dart';

Color colorss = Colors.white;
int currentIndex = 0;
final CarouselController carouselController = CarouselController();

class homes extends StatefulWidget {
  const homes({Key? key}) : super(key: key);

  @override
  State<homes> createState() => _homesState();
}

class _homesState extends State<homes> {
  dbhelper dbh = dbhelper();
  // ignore: unused_field
  late Box<Product> _productBox = Hive.box(dbname);
  int totalProducts = 0;

  @override
  void initState() {
    dbh.getall();
    super.initState();
  }

  List imagelist = [
    {'id': 1, 'imagepath': 'images/bagh.png'}, // Update with file path
    {'id': 2, 'imagepath': 'images/Rectangle1.png'}, // Update with file path
    {'id': 3, 'imagepath': 'images/Rectangle2.png'}, // Update with file path
  ];
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: imagelist
                        .map((item) => Image.asset(
                              item['imagepath'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
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
                ),
                Positioned(
                  left: 58,
                  top: 30,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'AWAY',
                          style: TextStyle(
                            color: Color(0xFF8C7A7A),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: ' LONGITUDE TOTE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: customeText(
                  texts: 'New Arrivals',
                  textsize: 20,
                  textweight: FontWeight.w600,
                  textspace: 2,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchscreen()));
                },
                child: Text('see more'),
              ),
            ],
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: productlist,
              builder: (context, List<Product> adminlist, Widget? child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: adminlist.length,
                  itemBuilder: (context, index) {
                    final product = adminlist[index];
                    // ignore: unnecessary_null_comparison
                    return InkWell(
                      onTap: () {
                        showDatas(
                          product.name,
                          product.image,
                          product.description,
                          product.price,
                          product.category,
                        );
                      },
                      child: customeproduct(
                          imageproduct: product.image,
                          pdname: product.name,
                          pdprice: product.price,
                          cate: product.category,
                          disc: product.description),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         width: 150,
                      //         height: 200,
                      //         child: imageready != null
                      //             ? Image.file(imageready)
                      //             : Placeholder(), // Placeholder if no image path is provided
                      //         decoration: ShapeDecoration(
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //         ),
                      //       ),
                      //       customeText(
                      //         texts: product.name,
                      //         textsize: 16,
                      //         textfam: 'Inter',
                      //         textweight: FontWeight.w800,
                      //         textspace: 1.60,
                      //       ),
                      //       customeText(
                      //         texts: '\₹ ${product.price}',
                      //         textcolor: Colors.black,
                      //         textsize: 16,
                      //         textfam: 'Inter',
                      //         textweight: FontWeight.w300,
                      //         textspace: 1.60,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    );
                  },
                );
              },
            ),
          )
        ],
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
          imagesp: imagepath,
          rate: price,
          color: colorss,
          discriptions: discrp,
        ),
      ),
    );
  }
}
