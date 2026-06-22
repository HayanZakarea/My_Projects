
import 'package:get/get.dart';
import 'create_user_controller.dart';
class CreateUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateUserController());
  }
}