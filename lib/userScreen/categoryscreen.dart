import 'package:shopex/userScreen/user_categorys.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<String> listnotice = [
    'images/ladies1.png',
    'images/notice5.png',
    'images/unix.png',
  ];
  List gender = ['WOMEN', 'MANS', 'UNISEX'];
  List Nav = [
    CategoryScreens(category: 'Ladies'),
    CategoryScreens(category: 'Mans'),
    CategoryScreens(category: 'unisex'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listnotice.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Nav[index]));
              },
              child: Stack(
                children: [
                  Container(
                    width: 410,
                    height: 165,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(listnotice[index]),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: customeText(
                      textweight: FontWeight.w700,
                      textspace: 2.1,
                      texts: gender[index],
                      textsize: 26,
                      textcolor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
