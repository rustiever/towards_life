import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../widgets/widgets.dart' show secondLayerState;

class HomeController extends GetxController {
  final SnappingSheetController snappingSheetController =
      SnappingSheetController();

  RxDouble xoffSet = 0.0.obs;
  RxDouble yoffSet = 0.0.obs;
  RxDouble angle = 0.0.obs;

  RxBool isOpen = false.obs;
  RxBool isPlaying = false.obs;

  void drawerClose() {
    if (isOpen.value == true) {
      xoffSet.value = 0;
      yoffSet.value = 0;
      angle.value = 0;
      isOpen.value = false;

      // ignore: invalid_use_of_protected_member
      secondLayerState.setState(() {
        secondLayerState.xoffSet = 0;
        secondLayerState.yoffSet = 0;
        secondLayerState.angle = 0;
      });
    }
  }

  void drawerOpen() {
    xoffSet.value = 150;
    yoffSet.value = 80;
    angle.value = -0.2;
    isOpen.value = true;

    // ignore: invalid_use_of_protected_member
    secondLayerState.setState(() {
      secondLayerState.xoffSet = 122;
      secondLayerState.yoffSet = 110;
      secondLayerState.angle = -0.275;
    });
  }
}
