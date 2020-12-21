import 'package:TowardsLife/app/data/repository/fireRepository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AdminController extends GetxController {
  final FireRepository repository;
  AdminController({@required this.repository}) : assert(repository != null);
  void setAll() => repository.setAll();
}
