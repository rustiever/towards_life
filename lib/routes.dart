import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'Models/Kurals.dart';
import 'bindings/bindings.dart';
import 'screens/screens.dart';

const String thirukkural = '/thirukkural';
const String home = '/';
const String kuralPage = '/kurals';
const String athisidi = '/athisudi';
const String athisudiPage = '/athisudiPage';

final routes = [
  GetPage(
    name: thirukkural,
    page: () => Homew(),
    binding: HomeBinding(),
  ),
];

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case thirukkural:
      return MaterialPageRoute(builder: (_) => Home());
    case kuralPage:
      var k = settings.arguments as Kural;
      return MaterialPageRoute(
          builder: (_) => Thirukkural(
                kurals: k,
              ));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
