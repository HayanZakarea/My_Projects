
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base_controller/send_data_controller.dart';
import '../../../../users/data/models/role_model.dart';
import '../../../data/data_source/order_data_source.dart';
import '../../../data/models/step_send_model.dart';
import '../order_types/order_types_controller.dart';

class CreateOrderTypeController extends SendDataController {

  final nameController = TextEditingController();
  final RxList<StepSendModel> steps = RxList();

  final stepNameController = TextEditingController();
  final Rxn<RoleModel> selectedRole = Rxn();
  final hasReport = false.obs;
  final canUpdate = false.obs;
  int arrangement = 1;
  final RxList<String> reportValues = RxList();

  @override
  void onInit() {
    ever(hasReport, (callback) => reportValues.clear());
    super.onInit();
  }


  bool addStep(){
    try{
      var step = StepSendModel(
          roleId: selectedRole.value!.id,
          name: stepNameController.text.trim(),
          hasReport: hasReport.value,
          canUpdate: canUpdate.value,
          arrangement: steps.length + 1,
          reportValues: reportValues.toList()
      );
      if(stepNameController.text.trim().isEmpty){
        return false;
      }
      steps.add(step);
      selectedRole(null);
      stepNameController.text = '';
      hasReport(false);
      canUpdate(false);
      reportValues.clear();
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future apiCall() => OrderDataSource.createOrderType(
    name:nameController.text,
    steps:steps,
  );

  @override
  void onSuccess() {
    super.onSuccess();
    Get.find<OrderTypesController>().loadData();
    Get.back();
  }



}