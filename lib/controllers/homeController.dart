import 'package:TowardsLife/Models/models.dart';
import 'package:TowardsLife/constants/constants.dart';
import 'package:TowardsLife/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped, paused, continued }

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController controller;
  final RxList kurals = [].obs;
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
  Future<void> onClose() {
    kurals.clear();
    controller.dispose();
    return super.onClose();
  }

  fetch() async {
    print('fetch');
    isLoading.value = true;
    Kural kural = await Service.instance.fetch(
        reset: reset,
        type: Type.kural,
        collectionReference: thirukkuralCollection);
    reset = false;
    if (kural != null) {
      print(kural.kurals.length.toString() + 'c fetch');
      kurals.addAll(kural.kurals);
    } else {
      print('went wrong');
    }
    isLoading.value = false;
  }
}
