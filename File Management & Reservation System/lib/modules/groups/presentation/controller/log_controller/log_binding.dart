import 'package:get/get.dart';
import 'package:web_app/modules/groups/presentation/controller/log_controller/log_controller.dart';

class LogBinding extends Bindings {

  @override
  void dependencies() {
    var arg = Get.arguments;
    print(arg);
    Get.put(LogController(arg['group'], arg['user'], arg['file']));

  }
}