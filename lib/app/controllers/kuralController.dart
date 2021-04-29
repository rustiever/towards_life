import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:towards_life/app/constants/constants.dart';

import '../data/model/models.dart';

class KuralController extends GetxController {
  static KuralController get to => Get.find();
  List<KuralDetail> kuralDetail = [];
  List<ChapterGroupDetail> iyalList = [];
  List<ChaptersDetail> adhikaramList = [];
  RxBool isLoading = false.obs;

  Future<void> _initialize() async {
    final data = json.decode(
      await rootBundle.loadString(kuralDetailsPath),
    );

    for (var i = 0; i < (data.length as int); i++) {
      final list = KuralDetail.fromJson(data[i] as Map<String, dynamic>);
      kuralDetail.add(list);
      final iyalDetail = list.chapterGroup.detail;

      for (final ChapterGroupDetail item in iyalDetail) {
        adhikaramList.addAll(item.chapters.detail);
      }
      iyalList.addAll(iyalDetail);
    }
    isLoading.toggle(); // updating to true
  }

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }
}
