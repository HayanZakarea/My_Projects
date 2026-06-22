
import 'package:get/get.dart';
import 'catalogs_controller.dart';

class CatalogsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CatalogsController());
  }
}