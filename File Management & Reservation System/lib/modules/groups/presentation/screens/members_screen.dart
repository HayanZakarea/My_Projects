import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/data_state/data_state.dart';

import '../controller/members/members_binding.dart';
import '../controller/members/members_controller.dart';
import 'log_screen.dart';
class MembersScreen extends GetView<MembersController> {
  const MembersScreen({super.key});

  static const _name = '/members';
  static final page = GetPage(
      name: _name,
      page: () => const MembersScreen(),
      binding: MembersBinding()
  );

  static void navigate(int id)=>
      Get.toNamed(_name,arguments: id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: SizedBox(),
              title: Text("Members"),
            ),
            GetBuilder<MembersController>(
                builder: (_){
                  if(controller.state.status.isSuccess){
                    var data = controller.state.data!;
                    return SliverList.builder(
                        itemCount: data.length,
                        itemBuilder: (_,i)=> Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(data[i].name),
                            subtitle: Text(data[i].email),
                            onTap: ()=> LogScreen.navigateUser(controller.groupId, data[i].id),
                          ),
                        )
                    );
                  }
                  if(controller.state.status.isFail){
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
    );
  }
}
