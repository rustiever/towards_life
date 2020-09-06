import 'package:TowardsLife/routes.dart' as router;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
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
        // fontFamily: 'ArimaMadurai',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
