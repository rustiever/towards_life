import 'dart:async';

import 'package:TowardsLife/Models/models.dart';
import 'package:TowardsLife/constants/constants.dart';
import 'package:TowardsLife/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// enum TtsState { playing, stopped, paused, continued }

class ChudiController extends GetxController {
  static ChudiController get to => Get.find();

// List<Rx<YourClass>> list = <Rx<YourClass>>[];

// list[0].update((yourClass){
// yourClass.likes = 35;
// })
  ScrollController controller;
  final RxList chudis = [].obs;
  final isLoading = false.obs;
  bool reset = true;

  @override
  void onInit() {
    reset = true;
    isLoading.value = true;
    print('in controller');
    controller = ScrollController()
      ..addListener(
        () {
          if (controller.position.pixels ==
              controller.position.maxScrollExtent) {
            print('no');
            fetch();
          }
        },
      );
    fetch();
    super.onInit();
  }

  @override
  FutureOr onClose() {
    chudis.clear();
    controller.dispose();
    return super.onClose();
  }

  Future<void> fetch() async {
    // print('fetch');
    isLoading.value = true;
    final AthisudiModel chudi = await Service.instance.fetch(
        reset: reset,
        type: Type.choodi,
        collectionReference: aathichoodiCollection) as AthisudiModel;
    reset = false;
    if (chudi != null) {
      chudis.addAll(chudi.athisudi);
    } else {
      // print('went wrong');
    }
    isLoading.value = false;
  }
}
