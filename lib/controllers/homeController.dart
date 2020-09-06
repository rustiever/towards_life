import 'dart:io';

import 'package:TowardsLife/Models/models.dart';
import 'package:TowardsLife/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped, paused, continued }

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;
  ScrollController controller;
  final RxList kurals = [].obs;
  final isLoading = false.obs;

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  ttsInit() {
    flutterTts = FlutterTts();
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        _getEngines();
      }
    }
  }

  @override
  void onInit() {
    print('in controller');
    controller = ScrollController();
    controller.addListener(
      () {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          print('no');
          fetch();
        }
      },
    );
    fetch();
    ttsInit();
    super.onInit();
  }

  @override
  Future<void> onClose() {
    controller.dispose();
    return super.onClose();
  }

  fetch() async {
    print('fetch');
    isLoading.value = true;
    Kural kural = await Service.instance.fetch();
    if (kural != null) {
      print(kural.kurals.length.toString() + 'c fetch');
      kurals.addAll(kural.kurals);
    } else {
      print('went wrong');
    }
    isLoading.value = false;
  }
}
