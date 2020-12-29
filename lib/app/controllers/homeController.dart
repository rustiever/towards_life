import 'package:TowardsLife/app/constants/constants.dart';
import 'package:TowardsLife/app/data/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  ScrollController scrollController;

  KuralDetail kuralDetail;

  @override
  Future<void> onInit() async {
    scrollController = ScrollController();
    // kuralDetail = await loadDetails(kuralDetailsPath);
    comp(await rootBundle.loadString(kuralDetailsPath));
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onInit();
  }

  Future<void> tryMe() async {
    comp(await rootBundle.loadString(kuralDetailsPath));
    // kuralDetail = await compute(loadDetails, kuralDetailsPath);
  }

  Future<void> comp(String key) async {
    // kuralDetail = await compute(loadDetails, key);
    kuralDetail = loadDetails(key);
    print(kuralDetail.classification.detail.length);
    print(kuralDetail.classification.tamil);
  }
}

KuralDetail loadDetails(String key) {
  return kuralDetailFromJson(key);
}
