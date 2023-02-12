import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CheckPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isSplashVisited', true);

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('login_page');
    });
  }

  @override
  void initState() {
    CheckPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 200,)
        ],
      ),
    );
  }
}
