
import 'package:get/get.dart';

import 'update_catalog_controller.dart';

class UpdateCatalogBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UpdateCatalogController(Get.arguments));
  }
}