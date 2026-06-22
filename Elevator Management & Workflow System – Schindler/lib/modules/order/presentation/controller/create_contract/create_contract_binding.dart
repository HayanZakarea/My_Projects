

import 'package:get/get.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/forms/forms_binding.dart';

import 'create_contract_controller.dart';

class CreateContractBinding extends FormBinding {

  @override
  void dependencies() {
    super.dependencies();
    Get.put(CreateContractController());
  }
}