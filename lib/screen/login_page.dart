import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globlas/globlas.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login_page(),
  ));
}

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController =
  TextEditingController(text: Globals.email);
  TextEditingController passwordController =
  TextEditingController(text: Globals.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white
                      // image: DecorationImage(
                      //     image: AssetImage("icon/background.jpg"),
                      //     fit: BoxFit.cover),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:const [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('icon/logo.png'),
                        ),
                        SizedBox(

                          height: 30,
                        ),
                        Text(
                          "Plz  Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter The Email";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (val) {
                              setState(() {
                                Globals.email = (val);
                              });
                            },

                            onChanged: (val) {
                              setState(() {
                                Globals.email = val;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter The password";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (val) {
                              setState(() {
                                Globals.password = (val);
                              });
                            },
                            controller: passwordController,
                            onChanged: (val) {
                              setState(() {
                                Globals.password = val;
                              });
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(
                                Colors.green),
                          ),
                          onPressed: () async{
                            if(emailController.text == 'abc'&&passwordController.text == '123'){
                              SharedPreferences prefs = await SharedPreferences.getInstance();

                              await prefs.setBool('isLoggedIn', true);
                              await Navigator.of(context).pushReplacementNamed('HomePage');
                            }
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                          },
                          child: const Text("Login"),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(
                          endIndent: 30,
                          indent: 30,
                          thickness: 1,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Image(
                                    image: AssetImage('icon/google.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Image(
                                    image: AssetImage('icon/facebook.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage('icon/apple.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
