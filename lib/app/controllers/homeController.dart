import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  KuralDetail kuralDetail;

  @override
  Future<void> onInit() async {
    // kuralDetail = await loadDetails(kuralDetailsPath);
    super.onInit();
  }

  Future<void> tryMe() async {
    comp(await rootBundle.loadString(kuralDetailsPath));
    // kuralDetail = await compute(loadDetails, kuralDetailsPath);
  }
}

Future<void> comp(String key) async {
  final kuralDetail = await compute(loadDetails, key);
  print(kuralDetail.section.detail.length);
  print(kuralDetail.section.tamil);
}

Future<KuralDetail> loadDetails(String key) async {
  return kuralDetailFromJson(key);
}
