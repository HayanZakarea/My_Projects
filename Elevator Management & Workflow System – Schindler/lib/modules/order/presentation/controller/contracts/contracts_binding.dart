
import 'package:get/get.dart';
import 'contracts_controller.dart';

class ContractsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ContractsController());
  }
}