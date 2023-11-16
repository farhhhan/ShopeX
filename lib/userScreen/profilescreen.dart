import 'dart:io';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopex/userScreen/editprofile.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:flutter/material.dart';

String userEmail = '';
User? currentUser;

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences _shared = await SharedPreferences.getInstance();
    userEmail = _shared.getString('mails')!;
    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );
  }

  Future<String> assetToFile(String assetImagePath) async {
    // Create a temporary file path
    String tempPath =
        "${Directory.systemTemp.path}/${DateTime.now().millisecondsSinceEpoch}_temp.jpg";

    // Write the bytes to the file

    return tempPath;
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditProfileScreen(currentUser: currentUser),
                ),
              );
            },
          ),
        ],
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
                backgroundImage: currentUser?.image != null
                    ? FileImage(File(currentUser!.image!))
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
            title: customeText(texts: '${currentUser?.name}'),
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
            title: customeText(texts: '${currentUser?.email}'),
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
            title: customeText(texts: '${currentUser?.number}'),
          ),
        ],
      ),
    );
  }
}
