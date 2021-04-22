import 'package:get/get.dart';
import 'package:towards_life/app/data/repository/fireRepository.dart';

class AdminController extends GetxController {
  final FireRepository repository;
  AdminController({required this.repository});
  void setAll() => repository.setAll();
}
