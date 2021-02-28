import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:towards_life/app/constants/constants.dart';
import 'package:towards_life/app/data/model/models.dart';

class KuralController extends GetxController {
  static KuralController get to => Get.find();
  List<KuralDetail> kuralDetail;
  @override
  Future<void> onInit() async {
    final data = await rootBundle.loadString(kuralDetailsPath);
    final jsonData = json.decode(data);
    print(jsonData.runtimeType);
    final n = jsonData.length as int;
    print(n);
    for (int i = 0; i < n; i++) {
      final item = jsonData[i];
      print(item);
      kuralDetail.add(
        KuralDetail.fromJson(item as Map<String, dynamic>),
      );
    }
    super.onInit();
    // print(kuralDetail.last.name);
  }
}
