
import 'package:get/get.dart';

import 'parts_controller.dart';

class PartsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(PartsController());
  }
}