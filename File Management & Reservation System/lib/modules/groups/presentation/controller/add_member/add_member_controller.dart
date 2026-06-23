
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/core/data_state/exception_handler.dart';
import 'package:web_app/modules/groups/data/data_source/groups_data_source.dart';
import 'package:web_app/modules/groups/data/model/user_model.dart';

class AddMemberController extends LoadDataController<List<UserModel>>{

  final int groupId;
  AddMemberController(this.groupId);


  String _name = '';

  @override
  Future<List<UserModel>> apiCall()
    => GroupsDataSource.searchUsers(groupId,_name);

  String get name => _name;

  set name(String value) {
    _name = value;
    loadData();
  }

  void addMember(UserModel user)async{
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        )
    );
    var resultState = await handle(() => GroupsDataSource.addMember(groupId, user.id));
    Get.back();

    if(resultState.isSuccess){
      Get.snackbar("User Invited Successfully","");
      loadData();
    }else{
      Get.snackbar("Error",resultState.message,colorText: Colors.red);
    }

  }
}