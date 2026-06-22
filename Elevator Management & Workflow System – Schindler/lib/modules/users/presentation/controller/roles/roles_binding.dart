
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
class RolesBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RolesController(Get.arguments));
  }
}