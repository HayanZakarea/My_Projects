
import 'package:get/get.dart';
import 'client_units_controller.dart';

class ClientUnitsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ClientUnitsController(Get.arguments));
  }
}