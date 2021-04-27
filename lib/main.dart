import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Towards Life",
      locale: Get.deviceLocale,
      theme: ThemeData(fontFamily: "NotoSansTamil"),
      fallbackLocale: const Locale('en', 'US'),
      // translationsKeys: AppTranslation.translationsKeys,
      initialRoute: Pages.homeRoute,
      getPages: Pages.pages,
    );
  }
}
