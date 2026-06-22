
import 'package:get/get.dart';

import 'team_info_controller.dart';

class TeamInfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(TeamInfoController(Get.arguments));
  }
}