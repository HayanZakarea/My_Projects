import 'package:elevator_management_app/modules/users/data/models/role_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String?  mobile;
  final List<RoleModel> roles;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.mobile,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.tryParse(json["email_verified_at"].toString()),
    mobile: json["mobile"],
    roles: (json['roles'] as List).map(
            (e) => RoleModel.fromJson(e)
    ).toList()
  );

}
