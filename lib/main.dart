import 'package:TowardsLife/Thir/routes/HomePage.dart';
import 'package:TowardsLife/screens/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const purpleDark = const Color(0xFF242072);
const Color purple = const Color(0xFF322379);
const accent = const Color(0xFFFDFDFD);
const cardColor = const Color(0xFFB3C2EA);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Towards Life',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'NotoSansTamil',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
