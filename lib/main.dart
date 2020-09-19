import 'package:TowardsLife/routes.dart' as router;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: router.thirukkural,
      getPages: router.routes,
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
