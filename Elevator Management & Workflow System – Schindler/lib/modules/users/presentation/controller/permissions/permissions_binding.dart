
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';

class PermissionBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(PermissionsController(Get.arguments));
  }
}