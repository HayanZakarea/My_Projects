
class InviteModel {
  final int id;
  final String groupName;

  InviteModel({
    required this.id,
    required this.groupName
  });

  factory InviteModel.fromJson(Map<String,dynamic> json) =>
      InviteModel(
          id: json['id'],
          groupName: json['group']['name']
      );
}