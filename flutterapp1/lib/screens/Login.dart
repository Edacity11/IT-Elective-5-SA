import 'package:flutter/material.dart';
import 'package:flutterapp1/shared/Constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          color: Colors.blue,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: screenSize.height,
            width: screenSize.width * .5,
            color: Colors.grey[200],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[50],
            ),
            width: screenSize.width,
            height: screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image(
                    image: AssetImage('assets/logo.png'),
                    width: screenSize.width * .35,
                  ),
                  Text("Welcome back!",
                      style: styleRobotoBold.copyWith(
                          letterSpacing: 0.1,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),
                  Text("Log in to your existant account of Q Allure",
                      style: styleOpenSans.copyWith(color: Colors.grey)),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.blue)),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.blue,
                      ),
                      hintText: 'E-mail',
                    ),
                    style: styleOpenSans.copyWith(
                        fontSize: 11,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.blue)),
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.blue,
                      ),
                      hintText: 'Password',
                    ),
                    style: styleOpenSans.copyWith(
                        fontSize: 11,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: styleOpenSans.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  ButtonTheme(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        primary: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/ProductList',
                        );
                      },
                      child: Text(
                        "LOG IN",
                        style: styleRobotoBold.copyWith(
                            fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Or connect using",
                      style: styleOpenSans.copyWith(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ButtonTheme(
                          minWidth: 50,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                print('Button Clicked');
                              },
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage('assets/fb.png'),
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Facebook",
                                    style: styleRobotoBold.copyWith(
                                        fontSize: 9, color: Colors.white),
                                  )
                                ],
                              ))),
                      SizedBox(width: 10),
                      ButtonTheme(
                          minWidth: 100,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange[600],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                print('Button Clicked');
                              },
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage('assets/google.png'),
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Google",
                                    style: styleRobotoBold.copyWith(
                                        fontSize: 9, color: Colors.white),
                                  )
                                ],
                              ))),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: styleOpenSans.copyWith(
                            color: Colors.black, fontSize: 10),
                      ),
                      Text(
                        "Sign Up",
                        style: styleOpenSans.copyWith(
                            color: Colors.blue[900], fontSize: 10),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}
