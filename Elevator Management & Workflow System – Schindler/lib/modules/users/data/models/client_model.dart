

class UserModel {
  final int id;
  final String name;
  final String personName;
  final String address;
  final String email;
  final String mobile;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.personName,
    required this.address,
    required this.email,
    required this.mobile,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    personName: json["person_name"],
    address: json["address"],
    email: json["email"],
    mobile: json["mobile"],
    createdAt: DateTime.parse(json["created_at"]),
  );

}
