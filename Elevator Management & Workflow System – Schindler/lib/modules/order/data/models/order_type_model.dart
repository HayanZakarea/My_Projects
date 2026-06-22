class OrderTypeModel {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<StepModel> steps;

  OrderTypeModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.steps,
  });


  factory OrderTypeModel.fromJson(Map<String, dynamic> json) => OrderTypeModel(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    steps: List<StepModel>.from((json["steps"] ?? []).map((x) => StepModel.fromJson(x))),
  );

}

class StepModel {
  final int id;
  final int orderTypeId;
  final int roleId;
  final String name;
  final bool hasReport;
  final bool canUpdate;
  final int arrangement;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ValueModel> values;

  StepModel({
    required this.id,
    required this.orderTypeId,
    required this.roleId,
    required this.name,
    required this.hasReport,
    required this.canUpdate,
    required this.arrangement,
    required this.createdAt,
    required this.updatedAt,
    required this.values,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
    id: json["id"],
    orderTypeId: json["order_type_id"],
    roleId: json["role_id"],
    name: json["name"],
    hasReport: json["has_report"] == 1,
    canUpdate: json["can_update"] == 1,
    arrangement: json["arrangement"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    values: List<ValueModel>.from((json["values"] ?? []).map((x) => ValueModel.fromJson(x))),
  );

}

class ValueModel {
  final int id;
  final String question;
  final String type;
  final int? stepId;

  ValueModel({
    required this.id,
    required this.question,
    required this.type,
    required this.stepId,
  });

  factory ValueModel.fromJson(Map<String, dynamic> json) => ValueModel(
    id: json["id"],
    question: json["question"],
    type: json["type"],
    stepId: json["step_id"],
  );

}
