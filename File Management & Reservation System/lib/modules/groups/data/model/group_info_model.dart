
class FileModel {
  final int id;
  final String name;
  final String file_path;
  final bool isFree;

  FileModel({
    required this.id,
    required this.name,
    required this.file_path,
    required this.isFree,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
      id: json['id'],
      name: json['name'],
      file_path: json['file_path'],
      isFree: json['state'] == 'free'
  );
}