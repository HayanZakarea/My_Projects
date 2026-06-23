
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/log_model.dart';

class LogController extends LoadDataController<List<LogModel>>{


  final int groupId;
  final int? userId;
  final int? fileId;


  LogController(this.groupId, this.userId, this.fileId);

  @override
  Future<List<LogModel>> apiCall() {
    if(userId != null) {
      return GroupsDataSource.getMemberLogs(groupId, userId!);
    }
      return GroupsDataSource.getFileLogs(groupId, fileId!);
  }

}