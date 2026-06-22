class PartModel {
  final int id;
  final String name;
  final int wholesalePrice;
  final int price;
  final int count;
  final bool isNationality;
  final DateTime createdAt;
  final DateTime updatedAt;

  PartModel({
    required this.id,
    required this.name,
    required this.wholesalePrice,
    required this.price,
    required this.count,
    required this.isNationality,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PartModel.fromJson(Map<String, dynamic> json) => PartModel(
    id: json["id"],
    name: json["name"],
    wholesalePrice: json["wholesale_price"],
    price: json["price"],
    count: json["count"],
    isNationality: json["is_nationality"] != 0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}