
import 'package:get/get.dart';
import 'order_info_controller.dart';

class OrderInfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(OrderInfoController(Get.arguments));
  }
}