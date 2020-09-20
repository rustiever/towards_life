import 'package:TowardsLife/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'bindings/bindings.dart';
import 'screens/screens.dart';

const String Thirukkuralroute = '/thirukkural';
const String Homeroute = '/';
const String Kuralroute = '/kurals';
const String Athichoodiroute = '/athisudi';
const String AthichoodiQuotes = '/athisudiPage';

final routes = [
  GetPage(
    name: Thirukkuralroute,
    page: () => Homew(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Homeroute,
    page: () => HomeView(),
    // binding: HomeBinding(),
  ),
];

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Thirukkuralroute:
      return MaterialPageRoute(builder: (_) => Home());
    // case Kuralroute:
    //   var k = settings.arguments as Kural;
    //   return MaterialPageRoute(
    //       builder: (_) => Thirukkuralroute(
    //             kurals: k,
    //           ));
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
