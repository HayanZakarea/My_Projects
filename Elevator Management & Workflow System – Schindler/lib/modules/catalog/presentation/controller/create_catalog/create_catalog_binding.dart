
import 'package:get/get.dart';
import 'create_catalog_controller.dart';

class CreateCatalogBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateCatalogController());
  }
}