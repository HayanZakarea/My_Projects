
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';
import 'create_visit_controller.dart';

class CreateVisitBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateVisitController(Get.arguments));
    //Get.put(UsersController());
  }
}