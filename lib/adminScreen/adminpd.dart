import 'dart:io';

import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class adminprofile extends StatefulWidget {
  adminprofile(
      {required this.imagepath,
      required this.mail,
      required this.number,
      required this.username,
      super.key});

  String imagepath;
  String username;
  String mail;
  String number;

  @override
  State<adminprofile> createState() => _adminprofileState();
}

class _adminprofileState extends State<adminprofile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: customeText(
          textcolor: Colors.white,
          texts: 'Profile',
          textsize: 25,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 90,
                // ignore: unnecessary_null_comparison
                backgroundImage: widget.imagepath != null
                    ? FileImage(File(widget.imagepath))
                    : null,
                // ignore: unnecessary_null_comparison
                child: widget.imagepath == null
                    ? Image.asset(
                        'images/prf.jpeg',
                        fit: BoxFit.contain,
                      )
                    : null,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: customeicon(
              Iconss: Icons.person,
              colorss: Colors.blue,
            ),
            title: customeText(texts: 'Name :${widget.username}'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: customeicon(
              Iconss: Icons.mail,
              colorss: Colors.blue,
            ),
            title: customeText(texts: 'E-mail :${widget.mail}'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: customeicon(
              Iconss: Icons.phone,
              colorss: Colors.blue,
            ),
            title: customeText(texts: 'Number :${widget.number}'),
          ),
        ],
      ),
    );
  }
}
