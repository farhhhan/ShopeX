import 'package:shopex/userScreen/Detialsscreen.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customeproduct.dart';
import 'package:shopex/wishlist/wish.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Color colorss = Colors.red;

class favourts extends StatefulWidget {
  const favourts({super.key});

  @override
  State<favourts> createState() => _favourtsState();
}

class _favourtsState extends State<favourts> {
  late Box<wishlist> wishBox = Hive.box<wishlist>('wish');
  // wishHelper whp = wishHelper();

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    wishBox = await Hive.openBox('wish');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: customeText(
            texts: 'Wish list',
            textsize: 26,
            textcolor: Colors.white,
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<Box<wishlist>>(
              valueListenable: wishBox.listenable(),
              builder: (context, wishBox, _) {
                final values = wishBox.values.toList();
                if (values.isEmpty) {
                  return Column(
                    children: [
                      Center(
                        child: Image.asset('images/wishlist.gif'),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: wishBox.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 3, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final vals = values[index];
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => productdetials(
                                            pdname: vals.name,
                                            imagesp: vals.image,
                                            rate: vals.price,
                                            color: vals.cate,
                                            discriptions: vals.disc,
                                          ),
                                        ));
                                  },
                                  child: customeproduct(
                                      imageproduct: vals.image!,
                                      pdname: vals.name,
                                      pdprice: vals.price),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 120,
                                top: 25,
                                child: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text('Remove from wish list'),
                                      backgroundColor: Colors.red,
                                    ));
                                    wishBox.deleteAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.favorite),
                                  iconSize: 35,
                                  color: colorss,
                                )),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ));
  }
}
