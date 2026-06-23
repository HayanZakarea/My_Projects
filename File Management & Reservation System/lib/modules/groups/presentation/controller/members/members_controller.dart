
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/user_model.dart';

class MembersController extends LoadDataController<List<UserModel>>{

  final int groupId;

  MembersController(this.groupId);

  @override
  Future<List<UserModel>> apiCall() =>
      GroupsDataSource.getGroupMembers(groupId);

}