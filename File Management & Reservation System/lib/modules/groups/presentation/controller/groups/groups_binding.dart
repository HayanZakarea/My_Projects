
import 'package:get/get.dart';
import 'groups_controller.dart';

class GroupBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(GroupsController());
  }
}