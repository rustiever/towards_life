import 'package:TowardsLife/controllers/controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
