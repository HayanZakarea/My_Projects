
class TeamModel {
  final int id;
  final String name;
  final int leaderId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<VisitModel> visits;

  TeamModel({
    required this.id,
    required this.name,
    required this.leaderId,
    required this.createdAt,
    required this.updatedAt,
    required this.visits,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    id: json["id"],
    name: json["name"],
    leaderId: json['leader_id'],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    visits: (json["visits"] as List?)?.map((e) =>
      VisitModel.fromJson(e)
    ).toList() ?? [],
  );

}

class VisitModel {
  final int id;
  final int elevatorId;
  final int teamId;
  final DateTime date;
  final String type;
  final bool confirm;
  final String? report;
  final List<VisitScheduleModel> visitSchedules;

  VisitModel({
    required this.id,
    required this.elevatorId,
    required this.teamId,
    required this.date,
    required this.type,
    required this.confirm,
    required this.report,
    required this.visitSchedules,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
    id: json["id"],
    elevatorId: json["elevator_id"],
    teamId: json["team_id"],
    report: json["report"],
    date: DateTime.parse(json["date"]),
    type: json["type"],
    confirm: json["confirm"] != 0,
    visitSchedules: List<VisitScheduleModel>.from((json["visit_schedules"] ?? []).map((x) => VisitScheduleModel.fromJson(x))),
  );


}

class VisitScheduleModel {
  final int id;
  final int? userId;
  final int visitId;
  final DateTime from;
  final DateTime to;
  final String note;

  VisitScheduleModel({
    required this.id,
    required this.userId,
    required this.visitId,
    required this.from,
    required this.to,
    required this.note,

  });

  factory VisitScheduleModel.fromJson(Map<String, dynamic> json) => VisitScheduleModel(
    id: json["id"],
    userId: json["user_id"],
    visitId: json["visit_id"],
    from: DateTime.parse(json["from"]),
    to: DateTime.parse(json["to"]),
    note: json["note"],
  );

}
