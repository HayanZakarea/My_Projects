class OrderModel {
  final int id;
  final int? userId;
  final int? clientId;
  final String title;
  final String description;
  final String typeOfService;
  final int numberOfUnits;
  final int numberOfElevators;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int contractId;
  final dynamic orderTypeId;
  final List<ElevatorModel>? elevators;
  final ContractModel? contract;
  final List<ValueModel>? values;
  final dynamic orderType;
  final List<StepModel2>? steps;

  OrderModel({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.title,
    required this.description,
    required this.typeOfService,
    required this.numberOfUnits,
    required this.numberOfElevators,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.contractId,
    required this.orderTypeId,
    required this.elevators,
    required this.contract,
    required this.values,
    required this.orderType,
    required this.steps,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    userId: json["user_id"],
    clientId: json["client_id"],
    title: json["title"],
    description: json["description"],
    typeOfService: json["type_of_service"],
    numberOfUnits: json["number_of_units"],
    numberOfElevators: json["number_of_elevators"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    contractId: json["contract_id"],
    orderTypeId: json["order_type_id"],
    elevators: List<ElevatorModel>.from(
        (json["elevators"] ?? []).map((x) => ElevatorModel.fromJson(x))),
    contract: json["contract"] != null
        ? ContractModel.fromJson(json["contract"])
        : null,
    values: List<ValueModel>.from(
        (json["values"] ?? []).map((x) => ValueModel.fromJson(x))),
    orderType: json["order_type"],
    steps: List<StepModel2>.from(
        (json["steps"] ?? []).map((x) => StepModel2.fromJson(x))),
  );
}

class StepModel2 {
  final String report;
  final String name;

  StepModel2({
    required this.report,
    required this.name,
  });

  factory StepModel2.fromJson(Map<String, dynamic> json) => StepModel2(
    report: json["report"] ?? "",
    name: json["step"] != null ? json["step"]["name"] ?? "" : "",
  );
}

class ContractModel {
  final int id;
  final int userId;
  final int? clientId;
  final int confirm;
  final String? title;
  final String? description;
  final int? numOfElevators;
  final int? numOfPayments;
  final dynamic clientConfirm;
  final DateTime? from;
  final DateTime? to;
  final int? price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ClientModel? client;
  final List<UnitModel> units;
  final List<ValueContractModel> values;

  ContractModel({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.confirm,
    required this.title,
    required this.description,
    required this.numOfElevators,
    required this.numOfPayments,
    required this.clientConfirm,
    required this.from,
    required this.to,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.client,
    required this.units,
    required this.values,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
    id: json["id"],
    userId: json["user_id"],
    clientId: json["client_id"],
    confirm: json["confirm"],
    title: json["title"],
    description: json["description"],
    numOfElevators: json["num_of_elevators"],
    numOfPayments: json["num_of_payments"],
    clientConfirm: json["client_confirm"],
    from: DateTime.tryParse(json["from"].toString()),
    to: DateTime.tryParse(json["to"].toString()),
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    client: json["client"] != null
        ? ClientModel.fromJson(json["client"])
        : null,
    units: List<UnitModel>.from(
        (json["units"] ?? []).map((x) => UnitModel.fromJson(x))),
    values: List<ValueContractModel>.from(
        (json["values"] ?? []).map((x) => ValueContractModel.fromJson(x))),
  );
}

class ValueContractModel {
  final int id;
  final int contractId;
  final String title;
  final String value;

  ValueContractModel({
    required this.id,
    required this.contractId,
    required this.title,
    required this.value,
  });

  factory ValueContractModel.fromJson(Map<String, dynamic> json) =>
      ValueContractModel(
        id: json["id"],
        contractId: json["contract_id"],
        title: json["title"],
        value: json["value"],
      );
}

class ClientModel {
  final int id;
  final String name;
  final String personName;
  final String address;
  final String email;
  final String mobile;

  ClientModel({
    required this.id,
    required this.name,
    required this.personName,
    required this.address,
    required this.email,
    required this.mobile,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    id: json["id"],
    name: json["name"],
    personName: json["person_name"],
    address: json["address"],
    email: json["email"],
    mobile: json["mobile"],
  );
}

class ElevatorModel {
  final int id;
  final int unitId;
  final String name;
  final DateTime start;
  final DateTime end;
  final List<dynamic> parts;
  final UnitModel? unit;

  ElevatorModel({
    required this.id,
    required this.unitId,
    required this.name,
    required this.start,
    required this.end,
    required this.parts,
    required this.unit,
  });

  factory ElevatorModel.fromJson(Map<String, dynamic> json) => ElevatorModel(
    id: json["id"],
    unitId: json["unit_id"],
    name: json["name"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    parts: List<dynamic>.from(json["parts"].map((x) => x)),
    unit: json["unit"] != null ? UnitModel.fromJson(json["unit"]) : null,
  );
}

class UnitModel {
  final int id;
  final int clientId;
  final String title;
  final double lat;
  final double lang;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;

  UnitModel({
    required this.id,
    required this.clientId,
    required this.title,
    required this.lat,
    required this.lang,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
    id: json["id"],
    clientId: json["client_id"],
    title: json["title"],
    lat: json["lat"],
    lang: json["lang"],
    address: json["address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other.hashCode == id;
}

class ValueModel {
  final int id;
  final int orderId;
  final String title;
  final String value;

  ValueModel({
    required this.id,
    required this.orderId,
    required this.title,
    required this.value,
  });

  factory ValueModel.fromJson(Map<String, dynamic> json) => ValueModel(
    id: json["id"],
    orderId: json["order_id"],
    title: json["title"],
    value: json["value"],
  );
}
