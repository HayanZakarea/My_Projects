
import 'package:get/get.dart';
import 'upload_requests_controller.dart';

class UploadRequestsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UploadRequestsController(Get.arguments));
  }
}