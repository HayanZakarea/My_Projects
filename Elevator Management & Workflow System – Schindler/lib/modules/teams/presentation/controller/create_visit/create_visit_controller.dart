
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';
import 'package:elevator_management_app/core/data_state/exception_handler.dart';
import 'package:elevator_management_app/core/file_handler/file_picker_handler.dart';
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

import 'package:get/get.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_controller.dart';
import 'package:elevator_management_app/modules/teams/data/data_source/teams_data_source.dart';
import 'package:elevator_management_app/modules/teams/data/models/schedule_model.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/teams/teams_controller.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';

import '../team_info/team_info_controller.dart';

class CreateVisitController extends SendDataController{

  final TeamModel model;


  CreateVisitController(this.model);


  ElevatorModel? _selectedElevator;

  final RxList<ScheduleModel> schedules = RxList();

  final type = 'maintenance'.obs;

  final Rxn<DateTime> date = Rxn();

  @override
  Future apiCall() => TeamsDataSource.createVisit(
      type: type.value,
      date: date.value!,
      elevatorId: _selectedElevator!.id,
      schedules: schedules,
      teamId: model.id
  );


  ElevatorModel? get selectedElevator => _selectedElevator;

  void selectElevator(ElevatorModel? elevatorModel){
    _selectedElevator = elevatorModel;
    update();
  }

  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<TeamInfoController>().loadData();
  }


  DataState<List<ElevatorModel>> _elevatorsState = const DataState();

  DataState<List<ElevatorModel>> get elevatorsState => _elevatorsState;

  void loadElevators()async{
    _elevatorsState = const DataState();
    _elevatorsState = await handle(() => TeamsDataSource.getElevators());
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadElevators();
  }
}