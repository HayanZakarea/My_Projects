
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/data/models/order_type_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/check_step/check_step_controller.dart';

class ApplyStepController extends SendDataController {

  final StepModel model;
  final int orderId;
  ApplyStepController(this.model,this.orderId);

  final reportController = TextEditingController();
  final answerController = TextEditingController();

  final RxMap<int,String> answers = RxMap();

  @override
  Future apiCall() => OrderDataSource.setStep(
      orderId: orderId,
      stepId: model.id,
      values: answers,
      report: reportController.text
  );

  void addAnswer(int id){
    answers[id] = answerController.text;
    answerController.clear();
  }

  @override
  void onSuccess() {
    super.onSuccess();
    Get.find<CheckStepController>().loadData();
    Get.back();
  }

}