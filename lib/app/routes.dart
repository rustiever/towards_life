import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'controllers/controllers.dart';
import 'data/provider/fireApi.dart';
import 'data/repository/fireRepository.dart';
import 'views/views.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const homeRoute = '/home';
  static const adminRoute = '/admin';
  static const kuralsListRoute = '/Thirukkural';
  static const aathichidiListRoute = '/Athichudi';
  static const searchRoute = '/Search';
  static const settingsRoute = '/settings';
  static const languageListRoute = '/languageList';

  static final pages = [
    GetPage(
      title: 'Settings',
      name: settingsRoute,
      page: () => SettingsView(),
      binding: BindingsBuilder.put(
        () => SettingsController(),
      ),
    ),
    GetPage(name: languageListRoute, page: () => LanguageListView()),
    GetPage(title: 'Home', name: homeRoute, page: () => HomeView(), bindings: [
      BindingsBuilder.put(
        () => HomeController(),
      ),
      BindingsBuilder.put(
        () => LibraryController(
          repository: FireRepository(
            apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
          ),
        ),
      ),
      BindingsBuilder.put(
        () => KuralController(
            // repository: FireRepository(
            //   apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
            // ),
            ),
      ),
    ]),
    GetPage(
      title: 'Aathichudi',
      name: aathichidiListRoute,
      page: () => AathichudiListView(),
      binding: BindingsBuilder.put(
        () => LibraryController(
          repository: FireRepository(
            apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
          ),
        ),
      ),
      parameter: const {"type": "kural"},
    ),
    GetPage(
      title: 'Kurals',
      name: kuralsListRoute,
      page: () => KuralsListView(),
      // bindings: [],
      parameter: const {"type": "kural"},
    ),
    GetPage(
      title: 'Admin',
      name: adminRoute,
      page: () => AdminView(),
      binding: BindingsBuilder(
        () => Get.lazyPut<AdminController>(
          () => AdminController(
            repository: FireRepository(
              apiClient: FireApiClient(firestore: FirebaseFirestore.instance),
            ),
          ),
        ),
      ),
    ),
  ];
}
