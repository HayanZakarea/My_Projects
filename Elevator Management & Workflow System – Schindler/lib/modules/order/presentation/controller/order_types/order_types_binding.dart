
import 'package:get/get.dart';
import './order_types_controller.dart';

class OrderTypesBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(OrderTypesController());
  }
}