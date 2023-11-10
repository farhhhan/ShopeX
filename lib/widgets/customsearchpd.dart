import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

class custumsearch extends StatelessWidget {
  custumsearch({
    required this.imagePath,
    required this.pdnames,
    required this.pdprices,
    super.key,
  });
  final imagePath;
  final pdnames;
  final pdprices;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 201,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 149,
              height: 201,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
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
              texts: pdnames,
              textcolor: Colors.black,
              textsize: 18,
              textweight: FontWeight.w800,
              textspace: 1.80,
            ),
          ),
          Positioned(
            left: 171,
            top: 140,
            child: SizedBox(
              width: 121,
              height: 21,
              child: customeText(
                texts: 'see detials',
                textcolor: Color(0xFF4C5CE6),
                textsize: 16,
                textweight: FontWeight.w800,
                textspace: 1.60,
              ),
            ),
          ),
          Positioned(
            left: 173,
            top: 102,
            child: customeText(
              texts: pdprices,
              textcolor: Colors.black,
              textsize: 16,
              textweight: FontWeight.w300,
              textspace: 1.60,
            ),
          ),
        ],
      ),
    );
  }
}
