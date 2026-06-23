
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/core/data_state/exception_handler.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/invite_model.dart';

class InvitesController extends LoadDataController<List<InviteModel>> {
  @override
  Future<List<InviteModel>> apiCall() =>
      GroupsDataSource.getInvites();

  void acceptReject(InviteModel model,bool isAccept)async{
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        )
    );
    var res = await handle(
            () => isAccept ?
            GroupsDataSource.acceptInvite(model.id):
            GroupsDataSource.rejectInvite(model.id)
    );
    Get.back();
    if(res.isSuccess){
      loadData();
    }else{
      Get.snackbar("Error", res.message);
    }
  }

}