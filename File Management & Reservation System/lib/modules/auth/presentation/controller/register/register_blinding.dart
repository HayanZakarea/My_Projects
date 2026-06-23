
import 'package:get/get.dart';
import 'package:web_app/modules/auth/presentation/controller/register/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}