// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/data/model/kuralDetailModel.dart';
import 'app/routes.dart';

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
  comp();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.homeRoute,
      getPages: AppPages.pages,
    ),
  );
}

Future<void> comp() async {
  final kuralDetail = await compute(loadDetails, kuralDetailsPath);
  print(kuralDetail.section.detail.length);
}

Future<KuralDetail> loadDetails(String kuralDetails) async {
  return kuralDetailFromJson(await rootBundle.loadString(kuralDetails));
}
