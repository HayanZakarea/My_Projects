
import 'dart:typed_data';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/teams/data/models/schedule_model.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';

class TeamsDataSource {

  static Future<List<TeamModel>> getTeams()async{
    var response = await NetworkHandler().get(ApiConst.team);
    List data = response.data['data']['team'];

    return data.map(
            (e) => TeamModel.fromJson(e)
    ).toList();
  }

  static Future<TeamModel> getTeamById(int id)async{
    var response = await NetworkHandler().get(ApiConst.teamById(id));
    return TeamModel.fromJson(response.data['data']['team']);
  }

  static Future<void> createTeam({
    required String name,
    required int leaderId,
}) =>
      NetworkHandler().post(
          ApiConst.team,
          data: {
            'name': name,
            'leader_id': leaderId,
          }
      );


  static Future<void> createVisit({
    required int teamId,
    required int elevatorId,
    required DateTime date,
    required String type,
    required List<ScheduleModel> schedules,
}) =>
      NetworkHandler().post(
          ApiConst.visit,
          data: {
            'team_id': teamId,
            'elevator_id': elevatorId,
            'date': date.toIso8601String(),
            'type': type,
            'schedules': schedules.map((e) => e.json).toList()
          }
      );

  static Future<void> confirmVisit(id,report) =>
      NetworkHandler().post(
          ApiConst.visitConfirm,
          data: {
            'visit_id': id,
            'report':report
          }
      );


  static Future<List<ElevatorModel>> getElevators() async {
    var response = await NetworkHandler().get(ApiConst.elevators);
    List data = response.data['data']['elevator'];
    return data.map((e) => ElevatorModel.fromJson(e)).toList();
  }

}