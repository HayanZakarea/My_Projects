class PermissionModel {
  final int id;
  final String name;

  PermissionModel({
    required this.id,
    required this.name,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) => PermissionModel(
    id: json["id"],
    name: json["name"],
  );

  @override
  String toString() {
    return 'PermissionModel{id: $id, name: $name}';
  }

  @override
  int get hashCode {
    return toString().hashCode;
  }

  @override
  bool operator ==(Object other) {
    return other.hashCode == hashCode && other.runtimeType == runtimeType;
  }
}
