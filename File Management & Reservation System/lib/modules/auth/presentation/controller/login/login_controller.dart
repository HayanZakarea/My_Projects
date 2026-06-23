
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/send_data_controller.dart';
import 'package:web_app/modules/auth/data/data_source/auth_data_soure.dart';
import 'package:web_app/modules/groups/presentation/screens/groups_screen.dart';

class LoginController extends SendDataController<void> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> apiCall() =>
      AuthDataSource.login(
          email: emailController.text,
          password: passwordController.text
      );

  @override
  void onSuccess() {
    Get.offAllNamed(GroupsScreen.name);
  }



}