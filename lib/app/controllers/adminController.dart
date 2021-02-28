import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:towards_life/app/data/repository/fireRepository.dart';

class AdminController extends GetxController {
  final FireRepository repository;
  AdminController({@required this.repository}) : assert(repository != null);
  void setAll() => repository.setAll();
}
