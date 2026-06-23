import 'package:get/get.dart';

import 'invites_controller.dart';

class InvitesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InvitesController());
  }

}