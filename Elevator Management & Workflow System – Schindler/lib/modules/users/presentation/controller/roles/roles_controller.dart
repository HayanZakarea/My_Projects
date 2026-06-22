
import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';

class RolesController extends LoadDataController<List<RoleModel>>{
  @override
  Future<List<RoleModel>> apiCall() =>
      UsersDataSource.getAllRoles();


  final ValueChanged<RoleModel>? select;

  RolesController(this.select);

}