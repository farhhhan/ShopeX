import 'dart:io';

import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customecart extends StatelessWidget {
  customecart({
    required this.imagepath,
    required this.pdnames,
    required this.colorss,
    this.qnty,
    required this.pdprice,
    super.key,
  });
  final imagepath;
  final pdnames;
  final colorss;
  String? qnty;
  String pdprice;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      image: FileImage(File(imagepath)),
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
                  texts: pdnames,
                  textweight: FontWeight.w800,
                  textspace: 1.60,
                ),
                customeText(
                  texts: 'Category: ${colorss}',
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
                      texts: 'Qty:  ${qnty}',
                      textsize: 16,
                      textweight: FontWeight.w800,
                      textspace: 1.60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
