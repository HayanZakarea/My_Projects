//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
// // import 'package:elevator_management_app/modules/groups/presentation/screens/groups_screen.dart';
//
// import '../../../data/data_source/auth_data_soure.dart';
// import '../../screens/register_screen.dart';
//
// class RegisterController extends SendDataController<void> {
//
//   final firstController = TextEditingController();
//   final lastController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   @override
//   Future<void> apiCall() => AuthDataSource.register(
//       name: "${firstController.text} ${lastController.text}",
//       email: emailController.text,
//       password: passwordController.text
//
//   );
//
//
//   @override
//   void onSuccess() {
//     Get.offAllNamed(GroupsScreen.name);
//   }
//
//
// }