
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/data/models/part_model.dart';
import 'package:elevator_management_app/modules/teams/data/data_source/teams_data_source.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';

class TeamsController extends LoadDataController<List<TeamModel>>{
  @override
  Future<List<TeamModel>> apiCall() => TeamsDataSource.getTeams();

}