import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/data_state/data_state.dart';

import '../controller/invites/invites_binding.dart';
import '../controller/invites/invites_controller.dart';

class InvitesScreen extends GetView<InvitesController> {
  const InvitesScreen({super.key});

  static const name = '/invites';
  static final page = GetPage(
      name: name,
      page: () => const InvitesScreen(),
      binding: InvitesBinding()
  );

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
              title: Text("Invites"),
            ),
            GetBuilder<InvitesController>(
                builder: (_){
                  if(controller.state.status.isSuccess){
                    var data = controller.state.data!;
                    return SliverList.builder(
                        itemCount: data.length,
                        itemBuilder: (_,i)=> Card(
                          child: ListTile(
                            title: Text(data[i].groupName),
                            trailing: PopupMenuButton(
                              itemBuilder:(_)=> [
                                'Accept',
                                'Reject'
                              ].map(
                                      (e) => PopupMenuItem(
                                          child: Text(e),
                                          onTap: ()=>
                                            controller.acceptReject(
                                                data[i],
                                                e == 'Accept'
                                            ),
                                      )
                              ).toList(),
                            ),
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
