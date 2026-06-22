
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/create_role/create_role_controller.dart';

class CreateRoleBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateRoleController());
  }
}