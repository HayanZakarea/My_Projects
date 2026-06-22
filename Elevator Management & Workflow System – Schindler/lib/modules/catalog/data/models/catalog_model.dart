
class CatalogModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<AttachmentModel> videos;
  final List<AttachmentModel> images;

  CatalogModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.videos,
    required this.images,
  });

  factory CatalogModel.fromJson(Map<String, dynamic> json) => CatalogModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    videos: List<AttachmentModel>.from((json["videos"] ?? []).map((x) => AttachmentModel.fromJson(x))),
    images: List<AttachmentModel>.from(json["images"].map((x) => AttachmentModel.fromJson(x))),
  );


}

class AttachmentModel {
  final int id;
  final int catalogId;
  final String? url;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  AttachmentModel({
    required this.id,
    required this.catalogId,
    required this.url,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => AttachmentModel(
    id: json["id"],
    catalogId: json["catalog_id"],
    url: json["url"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
