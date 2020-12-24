import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../data/model/kuralModel.dart';
import '../data/repository/fireRepository.dart';

class NoNameController extends GetxController {
  static NoNameController get to => Get.find();

  final FireRepository repository;
  NoNameController({@required this.repository}) : assert(repository != null);
  ScrollController scrollController;
  final RxList contentList = [].obs;
  int last;
  final isLoading = false.obs;
  final isMoreAvailable = true.obs;

  @override
  void onInit() {
    print(Get.parameters.length);
    last = 0;
    scrollController = ScrollController()
      ..addListener(
        () {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            print('no');
            _fetch();
          }
        },
      );
    _fetch();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetch() async {
    if (isLoading.isfalse) {
      const limit = 10;
      isLoading.value = true;

      if (isMoreAvailable.value) {
        final QuerySnapshot snapshots =
            await repository.fetchContents(kuralCollection, last: last);

        if (Get.parameters['name'] == 'Thirukkural') {
          for (final item in snapshots.docs) {
            contentList.add(
              Kural.fromJson(
                item.data(),
              ),
            );
          }
        }

        if (snapshots.docs.length >= limit) {
          last = contentList.length;
          print(last);
        } else {
          isMoreAvailable.value = false;
        }
      }

      isLoading.value = false;
    }
  }
}
