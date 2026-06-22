
import 'package:get/get.dart';
import 'client_controller.dart';

class CLientBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ClientController(Get.arguments));
  }
}