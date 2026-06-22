
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';
class UsersBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UsersController());
  }
}