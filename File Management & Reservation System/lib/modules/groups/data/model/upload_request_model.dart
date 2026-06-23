

class UploadRequestModel {

  final int id;
  final String fileName;
  final String temporaryPath;

  UploadRequestModel({
    required this.id,
    required this.fileName,
    required this.temporaryPath
  });

  factory UploadRequestModel.fromJson(Map<String,dynamic> json) =>
      UploadRequestModel(
          id: json['id'],
          fileName: json['file_name'],
          temporaryPath: json['temporary_path']
      );
}