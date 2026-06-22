
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/file_handler/file_picker_handler.dart';
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

import 'package:get/get.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_controller.dart';
import 'package:elevator_management_app/modules/teams/data/data_source/teams_data_source.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/teams/teams_controller.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';

class CreateTeamController extends SendDataController{

  @override
  Future apiCall() => TeamsDataSource.createTeam(
      name: nameController.text,
      leaderId: leader.value!.id
  );

  final nameController = TextEditingController();
  final Rxn<UserModel> leader = Rxn();

  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<TeamsController>().loadData();
  }


}