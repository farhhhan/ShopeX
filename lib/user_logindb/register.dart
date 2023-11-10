import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/widgets/customebar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class registerscreen extends StatefulWidget {
  const registerscreen({super.key});

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  bool isEmail(String input) => EmailValidator.validate(input);
  final _RegisterKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeappbar(Icons.arrow_back, title: '    Register'),
      body: Center(
        child: Card(
          elevation: 20,
          child: Container(
            width: 360,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _RegisterKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a address name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usernamecontroller.text = value!;
                      },
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                          labelText: "UserName",
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 0, 27, 49),
                              fontWeight: FontWeight.w800),
                          hintText: "Enter UserName",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 0, 54, 98),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passcontroller.text = value!;
                      },
                      controller: passcontroller,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 0, 27, 49),
                              fontWeight: FontWeight.w800),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: const Color.fromARGB(255, 0, 54, 98),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: numcontroller,
                      decoration: InputDecoration(
                          labelText: "Mobile number",
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 0, 27, 49),
                              fontWeight: FontWeight.w800),
                          hintText: "Enter your number",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.mobile_friendly,
                            color: const Color.fromARGB(255, 0, 54, 98),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!isPhone(value!)) {
                          return 'Please Enter Valid Number';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        numcontroller.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: mailcontroller,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 0, 27, 49),
                              fontWeight: FontWeight.w800),
                          hintText: "Enter Your Email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: const Color.fromARGB(255, 0, 54, 98),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (!isEmail(value!)) {
                          return 'Please Enter Valid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        numcontroller.text = value!;
                      },
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
                          if (_RegisterKey.currentState!.validate()) {
                            signup(
                                mailcontroller.text,
                                passcontroller.text,
                                context,
                                usernamecontroller.text,
                                numcontroller.text);
                            _RegisterKey.currentState!.save();
                            usernamecontroller.text = '';
                            mailcontroller.text = '';
                            passcontroller.text = '';
                            numcontroller.text = '';
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: customeText(texts: 'Sign Up'),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(String email, String password, BuildContext context, String name,
      String number) async {
    // await Hive.initFlutter(); // Initialize Hive
    await Hive.openBox<User>('users'); // Open the Hive box for users

    final usersBox = Hive.box<User>('users');

    final userExists = usersBox.values.any((user) => user.email == email);
    if (userExists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('User already exists'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      if (email == 'admin@gmail.com') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text('This Mail Not Allowed For Users'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        final user =
            User(email: email, password: password, name: name, number: number);
        usersBox.add(user);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Account created successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        getall2();
      }
    }
  }

  Future<void> getall2() async {
    final save = await Hive.openBox<User>('users');
    userslist.value.clear();
    userslist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    userslist.notifyListeners();
  }
}
