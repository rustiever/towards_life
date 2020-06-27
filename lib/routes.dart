import 'package:TowardsLife/screens/Home.dart';
import 'package:TowardsLife/screens/kuralDetails.dart';
import 'package:flutter/material.dart';

import 'Models/Kurals.dart';

const String homeRoute = '/';
const String thirukKurals = '/kurals';

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
