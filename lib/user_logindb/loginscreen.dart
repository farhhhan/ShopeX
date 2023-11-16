import 'package:shopex/adminScreen/admin_bottom.dart';
import 'package:shopex/userScreen/userBottom.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/main.dart';
import 'package:shopex/user_logindb/register.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: mailcontroller,
                decoration: InputDecoration(
                    labelText: "UserMail",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 27, 49),
                        fontWeight: FontWeight.w800),
                    hintText: "Enter UserMail",
                    hintStyle: TextStyle(color: Colors.black),
                    helperText: "Enter UserMail Characters",
                    helperStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    prefixIcon: Icon(
                      Icons.man_3_rounded,
                      color: const Color.fromARGB(255, 0, 54, 98),
                    ),
                    suffixIcon: Icon(
                      Icons.verified_user,
                      color: Color.fromARGB(255, 0, 49, 90),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passcontroller,
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 27, 49),
                        fontWeight: FontWeight.w800),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.black),
                    helperText: "Enter Password Characters",
                    helperStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: const Color.fromARGB(255, 0, 54, 98),
                    ),
                    suffixIcon: Icon(
                      Icons.verified_user,
                      color: Color.fromARGB(255, 0, 49, 90),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(12),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(58, 175, 169, 1),
                      )),
                  onPressed: () {
                    login(mailcontroller.text, passcontroller.text, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: customeText(texts: 'Login'),
                  )),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => registerscreen()));
                  },
                  child: customeText(texts: 'Register Here'))
            ],
          ),
        ),
      ),
    );
  }

  void login(String email, String password, BuildContext context) async {
    final usersBox =
        await Hive.openBox<User>('users'); // Open the Hive box for users

    User? user;

    for (var i = 0; i < usersBox.length; i++) {
      final currentUser = usersBox.getAt(i);
      if (currentUser?.email == email && currentUser?.password == password) {
        user = currentUser;
        break;
      }
    }

    if (user != null || (email == 'user@gmail.com' && password == 'user')) {
      // Login successful, navigate to home page or another screen
      SharedPreferences _shared = await SharedPreferences.getInstance();
      await _shared.setBool(SAVE_KEY, true);
      await _shared.setString('mails', email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyBottam()),
      );
    } else if (email == 'admin@gmail.com' && password == 'admin12') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => admin_main(),
          ));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid email or password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
