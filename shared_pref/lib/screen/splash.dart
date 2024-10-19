import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/constant/constant.dart';
import 'package:shared_pref/screen/auth_screen.dart';
import 'package:shared_pref/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Stack(
              children: [
                const Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1518826778770-a729fb53327c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.5)),
                const Center(
                    child: Text(
                  "Wellcome To \nSapschool",
                  style: splashHeading,
                  textAlign: TextAlign.center,
                ))
              ],
            )));
  }

  void loginCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = pref.getBool("isLogin") ?? false;

    Timer(const Duration(seconds: 4), () {
      if (isLogin) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AuthScreen()));
      }
    });
  }
}
