import 'package:get/get.dart';

import 'members_controller.dart';

class MembersBinding extends Bindings {


  @override
  void dependencies() {
    Get.delete<MembersController>();
    Get.put(MembersController(Get.arguments));
  }
}