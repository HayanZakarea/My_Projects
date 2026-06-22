
import 'package:get/get.dart';
import 'create_form_controller.dart';

class CreateFormBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateFormController());
  }
}