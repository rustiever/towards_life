import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'Models/Kurals.dart';
import 'bindings/bindings.dart';
import 'screens/screens.dart';

const String homeRoute = '/';
const String thirukKurals = '/kurals';

final routes = [
  GetPage(
    name: homeRoute,
    page: () => Homew(),
    binding: HomeBinding(),
  ),
];

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (_) => Home());
    case thirukKurals:
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
