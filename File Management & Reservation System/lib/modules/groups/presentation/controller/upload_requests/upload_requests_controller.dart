
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/upload_request_model.dart';
import 'package:web_app/modules/groups/presentation/controller/group_info/group_info_ontroller.dart';

import '../../../../../core/data_state/exception_handler.dart';

class UploadRequestsController extends LoadDataController<List<UploadRequestModel>> {

  final int groupId;

  UploadRequestsController(this.groupId);

  @override
  Future<List<UploadRequestModel>> apiCall()=>
      GroupsDataSource.getUploadRequests(groupId);


  void acceptReject(UploadRequestModel model,bool isAccept)async{
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        )
    );
    var res = await handle(
            () => isAccept ?
        GroupsDataSource.acceptUploadRequest(groupId,model.id):
        GroupsDataSource.rejectUploadRequest(groupId,model.id)
    );
    Get.back();
    if(res.isSuccess){
      loadData();
      if(isAccept) {
        Get.find<GroupInfoController>().loadData();
      }
    }else{
      Get.snackbar("Error", res.message);
    }
  }

}