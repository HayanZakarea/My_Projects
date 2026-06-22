import 'package:get/get.dart';

import 'create_order_type_controller.dart';

class CreateOrderTypeBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(CreateOrderTypeController());
  }
}