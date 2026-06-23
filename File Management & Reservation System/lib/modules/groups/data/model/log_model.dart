
import 'package:web_app/modules/groups/data/model/group_info_model.dart';
import 'package:web_app/modules/groups/data/model/group_model.dart';
import 'package:web_app/modules/groups/data/model/user_model.dart';

class LogModel {
  final int id;
  final String operationType;
  final String operationDescription;
  final int userId;
  final int groupId;
  final int fileId;
  final GroupModel group;
  final FileModel file;
  final UserModel user;
  final DateTime createdAt;

  LogModel({
    required this.id,
    required this.operationType,
    required this.operationDescription,
    required this.userId,
    required this.groupId,
    required this.fileId,
    required this.group,
    required this.file,
    required this.user,
    required this.createdAt
  });

  factory LogModel.fromJson(Map<String,dynamic> json) =>
      LogModel(
          id: json['id'],
          operationType: json['operation_type'],
          operationDescription: json['operation_description'],
          userId: json['user_id'],
          groupId: json['group_id'],
          fileId: json['file_id'],
          group: GroupModel.fromJson(json['group']),
          file: FileModel.fromJson(json['file']),
          user: UserModel.fromJson(json['user']),
          createdAt: DateTime.parse(json['created_at'])
      );

}


