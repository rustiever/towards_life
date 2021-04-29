import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();
  RxString selectedLanguage = Get.deviceLocale.languageCode.obs;

  String get selLanguage => selectedLanguage.value;

  set selLanguage(String lang) {
    final Locale locale = Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;
  }
}
