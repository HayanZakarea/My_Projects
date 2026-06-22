
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';

class CreateUserController extends SendDataController<void> {

  @override
  Future<void> apiCall() => UsersDataSource.createUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      roles: roles
  );


  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Set<RoleModel> roles = {};



  void selectAndUnSelect(RoleModel model){
    if(!roles.add(model)){
      roles.remove(model);
    }
    update();
  }

  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<UsersController>().loadData();
  }


}