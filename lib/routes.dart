import 'package:TowardsLife/controllers/controllers.dart';
import 'package:TowardsLife/controllers/thiruController.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
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
    binding: BindingsBuilder.put(() => ThiruController()),
  ),
  GetPage(
    name: homeroute,
    page: () => HomeView(),
    binding: BindingsBuilder.put(() => HomeController()),
  ),
  GetPage(
    name: athichoodiroute,
    page: () => AthichudiLists(),
    binding: BindingsBuilder.put(() => ChudiController()),
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
