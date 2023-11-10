import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customeText extends StatelessWidget {
  customeText(
      {this.textcolor,
      this.textsize,
      required this.texts,
      this.textweight,
      this.textspace,
      this.textfam});

  Color? textcolor;
  double? textsize;
  String texts;
  FontWeight? textweight;
  String? textfam;
  double? textspace;
  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: TextStyle(
          fontSize: textsize ?? 17,
          color: textcolor ?? Colors.black,
          fontWeight: textweight ?? FontWeight.w500,
          fontFamily: textfam ?? 'Inter',
          letterSpacing: textspace),
    );
  }
}
