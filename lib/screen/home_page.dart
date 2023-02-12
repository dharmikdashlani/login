import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn');

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const login_page()),
              );
            },
            icon: Icon(Icons.power_settings_new),
          )
        ],
      ),
      body: Column(),
    );
  }
}
