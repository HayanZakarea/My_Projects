
import 'package:flutter/cupertino.dart';
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';

class PermissionsController extends LoadDataController<List<PermissionModel>>{
  @override
  Future<List<PermissionModel>> apiCall() =>
      UsersDataSource.getAllPermission();

  final ValueChanged<PermissionModel>? select;

  PermissionsController(this.select);


}