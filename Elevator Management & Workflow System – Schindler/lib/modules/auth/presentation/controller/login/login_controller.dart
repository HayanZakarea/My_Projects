import 'dart:html' as html;


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/modules/auth/data/data_source/auth_data_soure.dart';
import 'package:elevator_management_app/modules/home/presentation/screens/home_screen.dart';
// import 'package:elevator_management_app/modules/groups/presentation/screens/groups_screen.dart';

class LoginController extends SendDataController<void> {

  final emailController = TextEditingController(
    text: 'superadmin@gmail.com'
  );
  final passwordController = TextEditingController(
    text: 'project5@2025'
  );

  @override
  Future<void> apiCall() =>
      AuthDataSource.login(
          email: emailController.text,
          password: passwordController.text
      );

  @override
  void onSuccess() {
    Get.offAllNamed(HomeScreen.name);
    html.window.location.reload();
  }



}