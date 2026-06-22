import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';

class RoleModel {
  final int id;
  final String name;
  final List<PermissionModel> permissions;

  RoleModel({
    required this.id,
    required this.name,
    required this.permissions,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json["id"],
    name: json["name"],
    permissions: (json['permissions'] as List).map((e)=> PermissionModel.fromJson(e)).toList()
  );


  @override
  int get hashCode {
    return toString().hashCode;
  }

  @override
  bool operator ==(Object other) {
    return other.hashCode == hashCode && other.runtimeType == runtimeType;
  }

}
