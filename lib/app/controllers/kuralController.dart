import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../data/model/models.dart';

class KuralController extends GetxController {
  static KuralController get to => Get.find();
  List<KuralDetail> kuralDetail = [];
  List<ChapterGroupDetail> iyalList = [];
  List<ChaptersDetail> adhikaramList = [];
  @override
  Future<void> onInit() async {
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
    super.onInit();
  }
}
