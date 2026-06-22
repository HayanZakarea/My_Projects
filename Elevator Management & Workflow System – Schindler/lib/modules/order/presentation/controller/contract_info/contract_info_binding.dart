
import 'package:get/get.dart';
import 'contract_info_controller.dart';

class ContractInfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ContractInfoController(Get.arguments));
  }
}