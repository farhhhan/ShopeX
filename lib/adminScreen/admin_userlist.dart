import 'package:shopex/adminScreen/adminpd.dart';
import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class admin_users extends StatefulWidget {
  const admin_users({super.key});

  @override
  State<admin_users> createState() => _admin_usersState();
}

class _admin_usersState extends State<admin_users> {
  @override
  void initState() {
    super.initState();
    getall2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.restore))
        ],
        backgroundColor: Colors.green,
        title: customeText(
          texts: 'Users list',
          textcolor: Colors.white,
          textsize: 26,
          textspace: 3.6,
          textweight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.green,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                      texts: 'Users are our God',
                      textcolor: Colors.white,
                      textsize: 30,
                      textweight: FontWeight.w600,
                      textspace: 2.2,
                    ),
                    customeText(
                        texts:
                            '''user just like a god , beacouse he treat we'''),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: userslist,
                builder: (context, List<User> uselist, Widget? child) {
                  if (uselist.isEmpty) {
                    return Center(
                      child: customeText(
                          texts: 'No Orders',
                          textcolor: Colors.red,
                          textsize: 27),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: uselist.length,
                      itemBuilder: (context, index) {
                        final userss = uselist[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => adminprofile(
                                          imagepath: userss.image!,
                                          username: userss.name,
                                          mail: userss.email,
                                          number: userss.number,
                                        )));
                          },
                          title: customeText(
                            texts: userss.name,
                          ),
                          subtitle: customeText(texts: userss.email),
                          leading: IconButton(
                              onPressed: () {
                                delete(index);
                              },
                              icon: Icon(Icons.delete)),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> getall2() async {
  final save = await Hive.openBox<User>('users');
  userslist.value.clear();
  userslist.value.addAll(save.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  userslist.notifyListeners();
}

Future<void> delete(int id) async {
  final remove = await Hive.openBox<User>('users');
  remove.delete(id);
  getall2();
}
