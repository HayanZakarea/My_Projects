import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/data_state/data_state.dart';
import 'package:web_app/modules/groups/presentation/controller/add_member/add_member_controller.dart';

class AddMemberSearchDelegate extends SearchDelegate {

  AddMemberSearchDelegate._();

  static void show(int groupId)async{
    Get.put(AddMemberController(groupId));
    await showSearch(
        context: Get.context!,
        delegate: AddMemberSearchDelegate._()
    );
    Get.delete<AddMemberController>();
  }

  AddMemberController get controller => Get.find();


  @override
  Widget buildSuggestions(BuildContext context) {
    controller.name = query;
    return GetBuilder<AddMemberController>(
        builder: (_){
          switch(controller.state.status){
            case DataStatus.success:
              var data = controller.state.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=>
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(data[i].name),
                    subtitle: Text(data[i].email),
                    trailing: Icon(Icons.add),
                    onTap: ()=> controller.addMember(data[i]),
                  ),
              );
            case DataStatus.fail:
              return Center(
                child: Text(controller.state.message),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        }
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {

  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }
}