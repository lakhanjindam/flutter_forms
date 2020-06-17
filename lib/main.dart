import 'package:flutter/material.dart';
import 'package:fluttertemplates/pages/form.dart';
import 'package:fluttertemplates/pages/home.dart';
import 'package:fluttertemplates/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/form': (context) => NewLoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
