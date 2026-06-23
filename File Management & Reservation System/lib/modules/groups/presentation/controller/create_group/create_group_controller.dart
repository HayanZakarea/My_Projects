
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/send_data_controller.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/presentation/controller/groups/groups_controller.dart';

class CreateGroupController extends SendDataController {

  final nameController = TextEditingController();

  @override
  Future apiCall() => GroupsDataSource.createGroup(nameController.text);

  @override
  void onSuccess() {
    Get.back();
    Get.find<GroupsController>().loadData();
  }
}