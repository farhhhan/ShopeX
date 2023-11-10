import 'package:shopex/userScreen/appinfo.dart';
import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Help'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(Icons.question_mark),
            title: Text(
              'Help Center',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.contact_page),
            title: Text(
              'Contact us',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text('Qustion ? Need Help'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.edit_document),
            title: Text(
              'Terms and privacy policy',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppInfoScreen(),
                  ));
            },
            leading: Icon(Icons.info),
            title: Text(
              'App info',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
