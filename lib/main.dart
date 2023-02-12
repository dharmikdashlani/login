import 'package:flutter/material.dart';
import 'package:login/screen/home_page.dart';
import 'package:login/screen/login_page.dart';
import 'package:login/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  bool? isLoggedVisited = prefs.getBool('isLoggedVisited') ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: (isLoggedVisited == true)
    //     ? (isLoggedIn == true)
    //         ? 'HomePage'
    //         : 'login_page'
    //     : 'SplashScreen',
    initialRoute: (isLoggedIn == true)?'HomePage' : 'login_page',
    routes: {
      'HomePage': (context) => HomePage(),
      'login_page': (context) => login_page(),
      // 'SplashScreen': (context) => SplashScreen(),
    },
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
