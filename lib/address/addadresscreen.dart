import 'package:shopex/address/address.dart';
import 'package:shopex/address/addresshelper.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class addadress extends StatefulWidget {
  const addadress({super.key});

  @override
  State<addadress> createState() => _addadressState();
}

class _addadressState extends State<addadress> {
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  bool isPin(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}$').hasMatch(input);
  final _addresskey = GlobalKey<FormState>();
  addressHelper adbhelp = addressHelper();
  TextEditingController addressname = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(texts: 'Add Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _addresskey,
          child: ListView(
            children: [
              TextFormField(
                controller: addressname,
                decoration: InputDecoration(
                    hintText: 'Enter  name',
                    border: OutlineInputBorder(),
                    label: customeText(
                      texts: 'Address Name ',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a address name';
                  }
                  return null;
                },
                onSaved: (value) {
                  addressname.text = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: usercontroller,
                decoration: InputDecoration(
                    hintText: 'Enter User name',
                    border: OutlineInputBorder(),
                    label: customeText(
                      texts: 'Name ',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
                onSaved: (value) {
                  usercontroller.text = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: numbercontroller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Enter  Mobile',
                    border: OutlineInputBorder(),
                    label: customeText(
                      texts: 'Mobile Number ',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (!isPhone(value!)) {
                    return 'Please enter valid number';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  numbercontroller.text = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: addresscontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: ' Enter address here',
                    label: customeText(
                      texts: 'Address',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a address';
                  }
                  return null;
                },
                onSaved: (value) {
                  addresscontroller.text = value!;
                },
                maxLines: null,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: citycontroller,
                decoration: InputDecoration(
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(),
                    label: customeText(
                      texts: 'City',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter City Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  citycontroller.text = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: pincontroller,
                decoration: InputDecoration(
                    hintText: 'Enter pincode',
                    border: OutlineInputBorder(),
                    label: customeText(
                      texts: 'Pin Code',
                      textsize: 20,
                    )),
                validator: (value) {
                  if (!isPin(value!)) {
                    return 'Please enter valid Pincode';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  pincontroller.text = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () {
                          if (_addresskey.currentState!.validate()) {
                            _addresskey.currentState!.save();
                            _addAddress(context);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: customeText(texts: 'Save address'),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addAddress(BuildContext context) async {
    final adrsname = addressname.text;
    final username = usercontroller.text;
    final number = numbercontroller.text;
    final address = addresscontroller.text;
    final city = citycontroller.text;
    final pin = pincontroller.text;
    if (adrsname.isNotEmpty &&
        username.isNotEmpty &&
        number.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty &&
        pin.isNotEmpty) {
      final datas = Address(
        name: adrsname,
        address: address,
        city: city,
        pincode: pin,
        id: -1,
        usrname: username,
        number: number,
      );
      addressname.text = '';
      usercontroller.text = '';
      numbercontroller.text = '';
      addresscontroller.text = '';
      citycontroller.text = '';
      pincontroller.text = '';
      adbhelp.save(datas);

      showDailogealert(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill all Datas'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: customeText(
              texts: 'Added address',
              textsize: 20,
              textweight: FontWeight.w600),
          content: customeText(texts: 'Address add succesfull'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: customeText(texts: 'Add another'))
          ],
        );
      },
    );
  }
}
