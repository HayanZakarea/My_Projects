import 'package:get/get.dart';

import 'apply_step_controller.dart';

class ApplyStepBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ApplyStepController(Get.arguments['model'],Get.arguments['order_id']));
  }
}