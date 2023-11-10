import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customedetial extends StatefulWidget {
  customedetial({
    required this.imagepath,
    required this.pdnames,
    required this.colorss,
    this.counter,
    required this.pdprice,
    required this.discrp,
    super.key,
  });
  String imagepath;
  final pdnames;
  final colorss;
  final discrp;
  String? counter;
  String pdprice;
  @override
  State<customedetial> createState() => _customedetialState();
}

class _customedetialState extends State<customedetial> {
  int counter = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                      image: AssetImage(widget.imagepath),
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
                  texts: widget.pdnames,
                  textweight: FontWeight.w800,
                  textspace: 1.60,
                ),
                customeText(
                  texts: 'color: ${widget.colorss}',
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
                      texts: 'Price:  ${widget.pdprice}',
                      textsize: 16,
                      textcolor: Colors.green,
                      textweight: FontWeight.w800,
                      textspace: 1.60,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                icon: Icon(Icons.add),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(child: customeText(texts: '${counter}')),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (counter > 0) {
                    setState(() {
                      counter--;
                    });
                  }
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
        Column(
          children: [
            customeText(texts: 'description'),
            Center(
              child: Card(
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: 450,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: customeText(texts: '${widget.discrp}'),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
