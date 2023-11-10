import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              InkWell(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/prf.jpeg'),
                  maxRadius: 90,
                ),
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
            title: customeText(texts: 'farhan'),
            trailing: IconButton(
                onPressed: () {}, icon: customeicon(Iconss: Icons.edit)),
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
            title: customeText(texts: 'farhan@gmail.com'),
            trailing: IconButton(
                onPressed: () {}, icon: customeicon(Iconss: Icons.edit)),
          )
        ],
      ),
    );
  }
}
