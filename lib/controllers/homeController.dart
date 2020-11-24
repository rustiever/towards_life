import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class HomeController extends GetxController {
  final SnappingSheetController snappingSheetController =
      SnappingSheetController();

  RxDouble xoffSet = 0.0.obs;
  RxDouble yoffSet = 0.0.obs;
  RxDouble angle = 0.0.obs;

  RxBool isOpen = false.obs;
  RxBool isPlaying = false.obs;
}
