import 'package:get/get.dart';

import 'check_step_controller.dart';

class CheckStepBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CheckStepController(Get.arguments));
  }
}