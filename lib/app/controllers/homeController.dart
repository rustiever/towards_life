import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  KuralDetail kuralDetail;

  @override
  Future<void> onInit() async {
    // kuralDetail = await loadDetails(kuralDetailsPath);
    comp(await rootBundle.loadString(kuralDetailsPath));
    super.onInit();
  }

  Future<void> tryMe() async {
    comp(await rootBundle.loadString(kuralDetailsPath));
    // kuralDetail = await compute(loadDetails, kuralDetailsPath);
  }

  Future<void> comp(String key) async {
    kuralDetail = await compute(loadDetails, key);
    print(kuralDetail.section.detail.length);
    print(kuralDetail.section.tamil);
  }
}

KuralDetail loadDetails(String key) {
  return kuralDetailFromJson(key);
}
