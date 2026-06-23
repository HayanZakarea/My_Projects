import 'package:get/get.dart';
import 'package:web_app/modules/groups/presentation/controller/group_info/group_info_ontroller.dart';

class GroupInfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.delete<GroupInfoController>();
    Get.put(GroupInfoController(Get.arguments));
  }
}