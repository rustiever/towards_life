import 'package:get/get.dart';

import 'views/views.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const homeRoute = '/home';

  static final pages = [
    GetPage(
      title: 'Home',
      name: homeRoute,
      page: () => HomeView(),
    ),
  ];
}
