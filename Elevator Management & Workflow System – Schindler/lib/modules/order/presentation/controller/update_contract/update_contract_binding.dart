

import 'package:get/get.dart';

import 'update_contract_controller.dart';

class UpdateContractBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UpdateContractController(Get.arguments));
  }
}