
import 'package:get/get.dart';
import 'create_part_controller.dart';

class CreatePartBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreatePartController());
  }
}