import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_app/core/data_state/data_state.dart';
import 'package:web_app/modules/groups/presentation/controller/group_info/group_info_binding.dart';
import 'package:web_app/modules/groups/presentation/controller/group_info/group_info_ontroller.dart';
import 'package:web_app/modules/groups/presentation/screens/log_screen.dart';
import 'package:web_app/modules/groups/presentation/screens/upload_requests_screen.dart';

import 'add_member_search_delegate.dart';
import 'members_screen.dart';

class GroupInfoScreen extends GetView<GroupInfoController> {
  const GroupInfoScreen({super.key});

  static const _name = '/group_info';
  static final page = GetPage(
      name: _name,
      page: () => const GroupInfoScreen(),
      binding: GroupInfoBinding()
  );

  static void navigate(int groupId) =>
      Get.toNamed(_name, arguments: groupId);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: CustomScrollView(
          slivers: [
            GetBuilder<GroupInfoController>(
              builder: (_) {
                return SliverAppBar(
                  leading: SizedBox(),
                  title: Text("Group Info"),
                  actions: controller.isAdmin ?[
                    IconButton(
                        onPressed: () =>
                            AddMemberSearchDelegate.show(controller.groupId),
                        icon: Icon(Icons.group_add)
                    ),
                    IconButton(
                        onPressed: () =>
                            MembersScreen.navigate(controller.groupId),
                        icon: Icon(Icons.groups)
                    ),
                    IconButton(
                        onPressed: () =>
                            UploadRequestsScreen.navigate(controller.groupId),
                        icon: Icon(Icons.fact_check_outlined)
                    ),
                  ]:null,
                );
              }
            ),


            GetBuilder<GroupInfoController>(
                builder: (_) {
                  if (controller.state.status.isSuccess) {
                    var data = controller.state.data!;
                    return SliverList.builder(
                        itemCount: data.$1.length,
                        itemBuilder: (_, i) =>
                            Card(
                              child: ListTile(
                                leading: Visibility(
                                  visible: data.$1[i].isFree,
                                  replacement: Icon(Icons.lock),
                                  child: IconButton(
                                    icon: Visibility(
                                      visible: controller.isSelected(data.$1[i]),
                                      replacement: Icon(Icons.check_box_outline_blank),
                                      child: Icon(Icons.check_box_outlined),
                                    ),
                                    onPressed: ()=>controller.checkFile(data.$1[i]),
                                  ),
                                ),
                                title: Text(data.$1[i].name),
                                trailing: PopupMenuButton(
                                  itemBuilder:(_)=> [
                                    'Download',
                                    'Info',
                                    if(!data.$1[i].isFree)
                                      'Check out',
                                    if(data.$2)
                                      'Delete'

                                  ].map(
                                          (e) => PopupMenuItem(
                                        child: ListTile(
                                          title: Text(e),
                                          onTap: (){
                                            if(e == 'Download'){
                                              controller.downloadFile(data.$1[i]);
                                            }
                                            if(e == 'Info') {
                                              LogScreen.navigateFile(
                                                  controller.groupId,
                                                  data.$1[i].id);
                                            }
                                            if(e == 'Check out'){
                                              controller.showUploadFileForm(data.$1[i].id);
                                            }
                                            if(e == 'Delete'){
                                              controller.deleteFile(data.$1[i].id);
                                            }
                                          },
                                        ),
                                      )
                                  ).toList(),

                                )
                              ),
                            )
                    );
                  }
                  if (controller.state.status.isFail) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(controller.state.message),
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.5.vmin)
        ),
        onPressed: controller.floatingAction,
        child: GetBuilder<GroupInfoController>(
          builder: (_) {
            if(controller.hasCheckedFiles)
              return Icon(Icons.check_circle_outline);
            return Icon(Icons.upload);
          }
        ),
      ),

    );
  }
}
