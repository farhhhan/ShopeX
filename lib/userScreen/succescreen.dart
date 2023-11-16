
import 'package:flutter/material.dart';
import 'package:shopex/userScreen/userBottom.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  void initState() {
    super.initState();
    succes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back),
      // ),
      body: Center(
        child: Image.asset('images/succes.gif'),
      ),
    );
  }

  Future<void> succes() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyBottam()));
  }
}
