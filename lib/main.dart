import 'package:flutter/material.dart';
import 'homepage.dart';
import 'pincode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PinCodeVerificationScreen(
          phoneNumber:
              "+8801376221100"), // a random number, please don't call xD
    );
  }
}
