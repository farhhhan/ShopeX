import 'package:shopex/userScreen/appinfo.dart';
import 'package:shopex/userScreen/privacy.dart';
import 'package:shopex/userScreen/terms.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/main.dart';
import 'package:shopex/userScreen/favoruts.dart';
import 'package:shopex/user_logindb/loginscreen.dart';
import 'package:shopex/userScreen/profilescreen.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:shopex/wishlist/wish.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class accountscreen extends StatefulWidget {
  const accountscreen({super.key});

  @override
  State<accountscreen> createState() => _accountscreenState();
}

class _accountscreenState extends State<accountscreen> {
  late Box<wishlist> wishBox = Hive.box<wishlist>('wish');
  // wishHelper whp = wishHelper();

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    wishBox = await Hive.openBox('wish');
  }

  final Uri _shopexprivacy = Uri.parse(
      'https://doc-hosting.flycricket.io/shopex-privacy-policy/7b60302c-7446-494a-a0d1-2ac27174dc00/privacy');
  Future<void> privacy() async {
    if (!await launchUrl(_shopexprivacy)) {
      throw Exception('could not laounch $_shopexprivacy');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customeText(
          texts: 'Account',
          textsize: 26,
          textcolor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeText(
                texts: 'Account Settings',
                textsize: 20,
                textspace: 1.8,
                textweight: FontWeight.w800,
              ),
              ListTile(
                leading: customeicon(
                  Iconss: Icons.home,
                  colorss: Colors.blue,
                ),
                title: customeText(
                  texts: 'Profile',
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profilescreen()));
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => favourts(),
                      ));
                },
                leading: customeicon(
                  Iconss: Icons.favorite,
                  colorss: Colors.blue,
                ),
                title: customeText(texts: 'Wish List'),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeText(
                texts: 'Pereference',
                textsize: 20,
                textspace: 1.8,
                textweight: FontWeight.w800,
              ),
              ListTile(
                onTap: () {
                  privacy();
                },
                leading: customeicon(
                  Iconss: Icons.privacy_tip,
                  colorss: Colors.blue,
                ),
                title: customeText(texts: 'Privacy Policy'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditionsPage()));
                },
                leading: customeicon(
                  Iconss: Icons.shield,
                  colorss: Colors.blue,
                ),
                title: customeText(texts: 'Terms And Condition'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => help(),
                      ));
                },
                leading: customeicon(
                  Iconss: Icons.help_center,
                  colorss: Colors.blue,
                ),
                title: customeText(texts: 'Help and Support'),
              ),
              ListTile(
                onTap: () {
                  showlogout(context);
                },
                leading: customeicon(
                  Iconss: Icons.logout,
                  colorss: Colors.blue,
                ),
                title: customeText(texts: 'Logout'),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  void showlogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: customeText(texts: 'Logout'),
          content: customeText(texts: 'You want logout'),
          actions: [
            TextButton(
                onPressed: () {
                  logout(context);
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

  void logout(BuildContext context) async {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (ctx) => loginScreen()), (Route) => false);
    final _shared = await SharedPreferences.getInstance();
    await _shared.setBool(SAVE_KEY, false);
  }
}
