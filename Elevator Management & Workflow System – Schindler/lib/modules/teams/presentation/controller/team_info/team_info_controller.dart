
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/data/models/part_model.dart';
import 'package:elevator_management_app/modules/teams/data/data_source/teams_data_source.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';
import '../../../../../core/data_state/exception_handler.dart';

class TeamInfoController extends LoadDataController<TeamModel>{

  final TeamModel model;


  TeamInfoController(this.model);

  @override
  Future<TeamModel> apiCall() => TeamsDataSource.getTeamById(model.id);

  void confirm(VisitModel model,String report) async{
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        )
    );
    var res = await handle(() => TeamsDataSource.confirmVisit(model.id,report));
    Get.back();
    if(res.isSuccess){
      loadData();
    }

  }

}