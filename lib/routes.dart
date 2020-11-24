import 'package:get/get.dart';
import 'controllers/controllers.dart';
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
    page: () => DrawerStack(),
    binding: BindingsBuilder.put(() => HomeController()),
  ),
  GetPage(
    name: athichoodiroute,
    page: () => AthichudiLists(),
    binding: BindingsBuilder.put(() => ChudiController()),
  ),
];
