
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/group_model.dart';

class GroupsController extends LoadDataController<List<GroupModel>> {

  @override
  Future<List<GroupModel>> apiCall()
    => GroupsDataSource.getMyGroups();

  void _listen(int id){
    GroupsDataSource.getNotifications(id).listen((event) {
      Get.snackbar("Notification", event);
    });
  }
  @override
  void onSuccess() {
    for(var g in state.data!) {
      _listen(g.id);
    }
  }

}