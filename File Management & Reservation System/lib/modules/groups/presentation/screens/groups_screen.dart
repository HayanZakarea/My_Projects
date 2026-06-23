import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_app/core/data_state/data_state.dart';
import 'package:web_app/core/storage/storage_handler.dart';
import 'package:web_app/modules/groups/presentation/controller/groups/groups_binding.dart';
import 'package:web_app/modules/groups/presentation/controller/groups/groups_controller.dart';

import 'create_group_screen.dart';
import 'group_info_screen.dart';
import 'invites_screen.dart';

class GroupsScreen extends GetView<GroupsController> {
  const GroupsScreen({super.key});

  static const name = '/groups';
  static final page = GetPage(
      name: name,
      page: () => const GroupsScreen(),
      binding: GroupBinding()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("My Groups"),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade300
            ]
          ),
        ),
        child: Row(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("Invites"),
                        onTap: ()=>Get.toNamed(InvitesScreen.name),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Logout"),
                        onTap: (){
                          StorageHandler().removeToken().then(
                                  (value) => Get.toNamed("/")
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
            VerticalDivider(),
            Expanded(
              flex: 3,
              child: GetBuilder<GroupsController>(
                  builder: (_){
                    if(controller.state.status.isSuccess){
                      var data = controller.state.data!;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (_,i)=> Card(
                            child: ListTile(
                              title: Text(data[i].name),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                print(data[i].id);
                                GroupInfoScreen.navigate(data[i].id);
                              },
                            ),
                          )
                      );
                    }
                    if(controller.state.status.isFail){
                      return Center(
                        child: Text(controller.state.message),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.5.vmin)
        ),
        onPressed: ()=> Get.toNamed(CreateGroupScreen.name),
        child: Icon(Icons.add),
      ),
    );
  }
}
