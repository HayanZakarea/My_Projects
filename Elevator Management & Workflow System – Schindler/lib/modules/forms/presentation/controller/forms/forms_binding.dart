
import 'package:get/get.dart';
import './forms_controller.dart';

class FormBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(FormsController());
  }
}