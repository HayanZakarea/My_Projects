
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';

class CreateRoleController extends SendDataController<void> {

  @override
  Future<void> apiCall() => UsersDataSource.createRole(
      nameController.text,
      permissions
  );

  final Set<PermissionModel> permissions = {};
  final nameController = TextEditingController();



  void selectAndUnSelect(PermissionModel model){
    if(!permissions.add(model)){
      permissions.remove(model);
    }
    update();
  }



  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<RolesController>().loadData();
  }


}