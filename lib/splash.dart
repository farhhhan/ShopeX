import 'package:shopex/widgets/custometext.dart';
import 'package:shopex/main.dart';
import 'package:shopex/user_logindb/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'images/logox.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(
                        texts: 'LOADING....',
                        textcolor: Colors.white,
                        textsize: 20,
                        textspace: 4.8,
                      ),
                      LinearProgressIndicator(
                        color: Colors.green,
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        minHeight: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loginFalse() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginScreen()));
  }

  Future<void> logintrue() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyBottam()));
  }

  Future<void> checkLogin() async {
    final _shared = await SharedPreferences.getInstance();
    final _logoin = _shared.getBool(SAVE_KEY);
    if (_logoin == true) {
      logintrue();
    } else {
      loginFalse();
    }
  }
}
