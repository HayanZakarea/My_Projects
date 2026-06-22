
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';
import 'create_team_controller.dart';

class CreateTeamBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CreateTeamController());
    Get.put(UsersController());
  }
}