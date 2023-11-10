import 'package:shopex/adminScreen/admin_orderlist.dart';
import 'package:shopex/adminScreen/admin_userlist.dart';
import 'package:shopex/admindb/dbfunc.dart';
import 'package:shopex/admindb/addproduct.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/admindb/product_detials.dart';
import 'package:shopex/orderfull/order.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/user_logindb/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

// late Box<Order> orderBox = Hive.box<Order>('order');
// late Box<Product> pdlist = Hive.box<Product>(dbname);
// late Box<User> userlist = Hive.box<User>('users');

class admin_home extends StatefulWidget {
  const admin_home({super.key});

  @override
  State<admin_home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<admin_home> {
  dbhelper dbh = dbhelper();
  int totalUserCount = 0; // Initialize the total user count
  int totalpdCount = 0;

  // List userslist = orderBox.values.toList();
  // List prdlist = pdlist.values.toList();
  @override
  void initState() {
    super.initState();
    // dbh.getall();
    // getall2();
    // updateTotalUsers();
    // updatepdcount();
  }

  // void updateTotalUsers() {
  //   totalUserCount = userslist.length;
  //   // Update the widget when the count changes
  // }

  // void updatepdcount() {
  //   totalpdCount = prdlist.length;
  //   // Update the widget when the count changes
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/logox.jpg'),
                    ),
                  ),
                  accountName: customeText(
                    textsize: 23,
                    texts: 'Admin',
                    textcolor: Colors.white,
                  ),
                  accountEmail: customeText(
                    texts: 'AdminshopeX@gmail.com',
                    textcolor: Colors.white,
                  )),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => admin_orderlist(),
                      ));
                },
                leading: Icon(Icons.list),
                title: customeText(texts: 'OrderList'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => admin_users(),
                      ));
                },
                leading: Icon(Icons.group),
                title: customeText(texts: 'UserList'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginScreen(),
                      ));
                },
                leading: Icon(Icons.logout),
                title: customeText(texts: 'Logout'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: customeText(
            texts: 'ShopeX',
            textsize: 26,
            textspace: 5.8,
            textweight: FontWeight.w800,
            textcolor: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'admin',
                    style: TextStyle(color: Colors.blue),
                  )),
            )
          ],
        ),
        body: ListView(children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.green,
              ),
              Container(
                height: 180,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              'Share store link',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      'admin can visit the following link and place their product'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'shopex12@.com',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                      ElevatedButton.icon(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      const Color.fromARGB(
                                                          255, 83, 240, 88))),
                                          onPressed: () {},
                                          icon:
                                              FaIcon(FontAwesomeIcons.whatsapp),
                                          label: Text('Share'))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: 300,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                      child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          autofocus: true,
                          title: Text('ORDERS'),
                          subtitle: Text(
                            '100',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        elevation: 10,
                      )
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                      child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          autofocus: true,
                          title: Text('TOTAL SALES'),
                          subtitle: Text(
                            '10923',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        elevation: 10,
                      )
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                      child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          autofocus: true,
                          title: Text('TOTAL USERS'),
                          subtitle: Text(
                            '$totalUserCount',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        elevation: 10,
                      )
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                      child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          onTap: () {
                            setState(() {});
                          },
                          autofocus: true,
                          title: Text('TOTAL PRDOUCT'),
                          subtitle: Text(
                            '$totalpdCount',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        elevation: 10,
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Shortcuts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
              height: 210,
              width: 300,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 3),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductAddingPage(),
                              ));
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                        child: Icon(
                                            Icons.production_quantity_limits)),
                                    color: Colors.green,
                                  ),
                                ),
                              ]),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: customeText(texts: 'Add product')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: InkWell(
                        onTap: () {
                          // getall();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductListingPage(),
                              ));
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Center(child: Icon(Icons.list)),
                                    color: Colors.green,
                                  ),
                                ),
                              ]),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: customeText(texts: 'Producst List')),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]))
        ]));
  }
}
