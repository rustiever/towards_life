import 'package:TowardsLife/app/data/model/models.dart';
import 'package:get/get.dart';

class KuralController extends GetxController {
  static KuralController get to => Get.find();
  KuralDetail kuralDetail;
  @override
  Future<void> onInit() async {
    // kuralDetail = comp(await rootBundle.loadString(kuralDetailsPath));
    super.onInit();
  }
}
