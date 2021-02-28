// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes.dart';
import 'app/translation/translation.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await GetStorage.init();
//   await Firebase.initializeApp();
//   runApp(
//     DevicePreview(
//       builder: (context) => GetMaterialApp(
//         title: "Application",
//         initialRoute: AppPages.homeRoute,
//         getPages: AppPages.pages,
//       ),
//     ),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await Hive.openBox('Get');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Towards Life",
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: AppTranslation.translationsKeys,
      initialRoute: AppPages.homeRoute,
      getPages: AppPages.pages,
      // home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('data'),
            ElevatedButton(
              onPressed: () async {
                // final hh = Hive.box('Get');
                // await hh.put("String", "hello");

                // print(hh.get('String'));
              },
              child: null,
            )
          ],
        ),
      ),
    );
  }
}
