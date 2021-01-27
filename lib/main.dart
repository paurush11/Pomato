import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/Homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoMaTo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Color(0xff232F34)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

