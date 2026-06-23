
class GroupModel {

  final int id;
  final int adminId;
  final String name;

  GroupModel({
    required this.id,
    required this.adminId,
    required this.name
  });

  factory GroupModel.fromJson(Map<String,dynamic> json) =>
      GroupModel(
        id: json['id'],
        name: json['name'],
        adminId: json['admin_id']
      );
}