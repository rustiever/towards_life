import 'package:TowardsLife/routes.dart' as router;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.homeRoute,
      title: 'Towards Life',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSansTamil',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
