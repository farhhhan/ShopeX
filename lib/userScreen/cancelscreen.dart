import 'package:shopex/orderfull/order.dart';
import 'package:shopex/userScreen/userBottom.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class cancelscreen extends StatefulWidget {
  cancelscreen({required this.id, super.key});
  int id;

  @override
  State<cancelscreen> createState() => _cancelscreenState();
}

class _cancelscreenState extends State<cancelscreen> {
  late Box<Order> orderBox = Hive.box<Order>('order');
  String cancel = "I just want cancel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyBottam(),
                    ));
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Order Cancel'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9, top: 15),
                child: customeText(
                  texts: 'Please select cancelation reason',
                  textcolor: Colors.red,
                  textweight: FontWeight.w800,
                  textsize: 20,
                  textspace: 1.6,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                child: RadioListTile(
                  title: customeText(
                    texts: "Waiting for long  time",
                    textweight: FontWeight.w600,
                  ),
                  value: "waiting for long  time",
                  groupValue: cancel,
                  onChanged: (value) {
                    setState(() {
                      cancel = value.toString();
                    });
                  },
                ),
              ),
              Card(
                elevation: 10,
                child: RadioListTile(
                  title: customeText(
                    texts: "Unable to connect with order",
                    textweight: FontWeight.w600,
                  ),
                  value: "Unable to connect with order",
                  groupValue: cancel,
                  onChanged: (value) {
                    setState(() {
                      cancel = value.toString();
                    });
                  },
                ),
              ),
              Card(
                elevation: 10,
                child: RadioListTile(
                  title: customeText(
                    texts: "Wrong address show",
                    textweight: FontWeight.w600,
                  ),
                  value: "wrong address show",
                  groupValue: cancel,
                  onChanged: (value) {
                    setState(() {
                      cancel = value.toString();
                    });
                  },
                ),
              ),
              Card(
                elevation: 10,
                child: RadioListTile(
                  title: customeText(
                    texts: "Price not reasonable",
                    textweight: FontWeight.w600,
                  ),
                  value: "price not reasonable",
                  groupValue: cancel,
                  onChanged: (value) {
                    setState(() {
                      cancel = value.toString();
                    });
                  },
                ),
              ),
              Card(
                elevation: 10,
                child: RadioListTile(
                  title: customeText(
                    texts: "I just want cancel",
                    textweight: FontWeight.w600,
                  ),
                  value: "I just want cancel",
                  groupValue: cancel,
                  onChanged: (value) {
                    setState(() {
                      cancel = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDailogealert(context, cancel);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: customeText(texts: 'Cancel order'),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(20),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void showDailogealert(BuildContext context, String val) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: customeText(
              texts: 'Order Cancelation',
              textsize: 23,
              textweight: FontWeight.w600),
          content: customeText(texts: 'Reason: ${val}'),
          actions: [
            TextButton(
                onPressed: () {
                  orderBox.deleteAt(widget.id);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyBottam(),
                      ));
                },
                child: customeText(texts: 'Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: customeText(texts: 'No'))
          ],
        );
      },
    );
  }
}
