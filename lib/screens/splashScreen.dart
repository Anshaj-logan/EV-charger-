import 'package:flutter/material.dart';
import 'dart:async';
import 'logreg.dart';
import 'mainloginpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()
                // LogReg()
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
        image: AssetImage("images/splash_logo.png"),
        fit: BoxFit.cover,
      )),
    );
  }
}
