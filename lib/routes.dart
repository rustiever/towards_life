import 'package:TowardsLife/views/homeView.dart';
import 'package:get/route_manager.dart';
import 'bindings/bindings.dart';
import 'views/views.dart';

const String thirukkuralroute = '/thirukkural';
const String homeroute = '/';
const String kuralroute = '/kurals';
const String athichoodiroute = '/athisudi';
const String athichoodiQuotes = '/athisudiPage';

final routes = [
  GetPage(
    name: thirukkuralroute,
    page: () => ThirukuralLists(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: homeroute,
    page: () => HomeView(),
    // binding: HomeBinding(),
  ),
  GetPage(
    name: athichoodiroute,
    page: () => AthichudiLists(),
  binding : ChudiBinding(),
  ),
];

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case thirukkuralroute:
//       return MaterialPageRoute(builder: (_) => Home());
//     // case Kuralroute:
//     //   var k = settings.arguments as Kural;
//     //   return MaterialPageRoute(
//     //       builder: (_) => Thirukkuralroute(
//     //             kurals: k,
//     //           ));
//     default:
//       return MaterialPageRoute(
//         builder: (_) => Scaffold(
//           body: Center(
//             child: Text('No route defined for ${settings.name}'),
//           ),
//         ),
//       );
//   }
// }
