import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/userScreen/Detialsscreen.dart';
import 'package:shopex/widgets/customebar.dart';
import 'package:shopex/widgets/customeproduct.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class searchscreen extends StatefulWidget {
  searchscreen({Key? key}) : super(key: key);

  Color colorss = Colors.white;

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  dbhelper dbh = dbhelper();
  late Box<Product> _productBox = Hive.box(dbname);
  Color colorss = Colors.white;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbh.getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeappbar(title: '     Search ', Icons.arrow_back),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Search Here',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          searchController.clear();
                        },
                        icon: Icon(Icons.close))),
                onChanged: (value) {
                  searchProducts(value);
                },
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: productlist,
              builder: (context, List<Product> adminlist, Widget? child) {
                if (adminlist.isEmpty) {
                  return Center(
                    child: customeText(texts: 'No Search Product'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: adminlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final product = adminlist[index];
// Updated image path as a File
                      if (productlist.value.isEmpty) {
                        setState(() {});
                        return Center(
                          child: Image.asset('images/no_result.gif'),
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: InkWell(
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
                                        cate: product.category,
                                        disc: product.description,
                                        imageproduct: product.image,
                                        pdname: product.name,
                                        pdprice: product.price))));
                      }
                    },
                  );
                }
              },
            ),
          ),
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
          imagesp: imagepath, // Pass the updated image path as a File
          rate: price,
          color: colorss,
          discriptions: discrp,
        ),
      ),
    );
  }

  void searchProducts(String value) {
    final products = _productBox.values.toList();
    final filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    productlist.value = filteredProducts;
  }
}
