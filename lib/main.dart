
import 'package:shopex/address/address.dart';
import 'package:shopex/cart/cart.dart';

import 'package:shopex/cart/order_cart.dart';
import 'package:shopex/orderfull/order.dart';
import 'package:shopex/user_logindb/userlogin.dart';
import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/admindb/product.dart';
import 'package:shopex/userScreen/categoryscreen.dart';
import 'package:shopex/userScreen/homescreen.dart';
import 'package:shopex/userScreen/searchscreen.dart';
import 'package:shopex/splash.dart';
import 'package:shopex/widgets/customeicons.dart';
import 'package:shopex/wishlist/wish.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

const SAVE_KEY = 'userlogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Check if the adapter is already registered

  // Register the ProductAdapter
  if (!Hive.isAdapterRegistered(ProductAdapter().typeId)) {
    Hive.registerAdapter(ProductAdapter());
  }
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(AddressAdapter().typeId)) {
    Hive.registerAdapter(AddressAdapter());
  }
  if (!Hive.isAdapterRegistered(OrderAdapter().typeId)) {
    Hive.registerAdapter(OrderAdapter());
  }
  if (!Hive.isAdapterRegistered(CartAdapter().typeId)) {
    Hive.registerAdapter(CartAdapter());
  }
  if (!Hive.isAdapterRegistered(OrderhistoryModelAdapter().typeId)) {
    Hive.registerAdapter(OrderhistoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(wishlistAdapter().typeId)) {
    Hive.registerAdapter(wishlistAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 80, 39, 88)),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class homeScreen extends StatefulWidget {
  homeScreen({this.name, super.key});
  final name;

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: CircleAvatar(
                child: Image.asset(
                  'images/logox.jpg',
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customeText(
                  texts: 'ShopeX',
                  textcolor: const Color.fromARGB(255, 135, 129, 129),
                  textsize: 20,
                  textfam: 'Inter',
                  textweight: FontWeight.w700,
                  textspace: 2,
                ),
                customeText(
                  texts: 'Lets go shopping',
                  textcolor: Colors.white,
                  textsize: 18,
                  textfam: 'Inter',
                  textweight: FontWeight.w700,
                  textspace: 1.80,
                )
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => searchscreen(),
                      ));
                },
                icon: customeicon(
                  Iconss: Icons.search,
                  sizes: 30,
                  colorss: Colors.black,
                ),
              ),
              SizedBox(
                width: 30,
              )
            ],
            bottom: TabBar(tabs: [
              Tab(
                  child: customeicon(
                Iconss: Icons.home,
                colorss: Colors.white,
              )),
              Tab(
                  child: customeicon(
                Iconss: Icons.category,
                colorss: Colors.white,
              ))
            ]),
          ),
          body: TabBarView(children: [homes(), category()]),
        ));
  }
}
