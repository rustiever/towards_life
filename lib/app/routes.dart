// ignore: avoid_classes_with_only_static_members
import 'package:get/get.dart';
import 'package:towards_life/app/controllers/controllers.dart';
import 'package:towards_life/app/controllers/kuralController.dart';
import 'package:towards_life/app/views/views.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  static const homeRoute = '/home';
  static const kuralListRoute = '/kural';
  static final pages = [
    GetPage(
      name: homeRoute,
      binding: BindingsBuilder.put(() => HomeController()),
      page: () => const HomeView(),
    ),
    GetPage(
        name: kuralListRoute,
        binding: BindingsBuilder.put(() => KuralController()),
        page: () => KuralsListView())
  ];
}
