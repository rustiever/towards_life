import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/constants.dart';
import '../data/model/kuralModel.dart';
import '../data/repository/fireRepository.dart';

class LibraryController extends GetxController {
  static LibraryController get to => Get.find();

  final FireRepository repository;
  LibraryController({@required this.repository}) : assert(repository != null);
  ScrollController scrollController;
  final RxList contentList = [].obs;
  int last;
  final isLoading = false.obs;
  final isMoreAvailable = true.obs;

  @override
  void onInit() {
    print(Get.parameters.length);
    // last = 0;
    // scrollController = ScrollController()
    //   ..addListener(
    //     () {
    //       if (scrollController.position.pixels ==
    //           scrollController.position.maxScrollExtent) {
    //         _fetch();
    //       }
    //     },
    //   );
    // _fetch();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetch() async {
    const limit = 10;
    QuerySnapshot snapshots;

    if (isLoading.isFalse) {
      isLoading.value = true;

      if (isMoreAvailable.value) {
        if (Get.parameters['name'] == 'Thirukkural') {
          snapshots =
              await repository.fetchContents(kuralCollection, last: last);
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
