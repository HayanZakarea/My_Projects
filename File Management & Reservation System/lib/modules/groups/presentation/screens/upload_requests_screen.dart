import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/data_state/data_state.dart';

import '../controller/upload_requests/upload_requests_binding.dart';
import '../controller/upload_requests/upload_requests_controller.dart';

class UploadRequestsScreen extends GetView<UploadRequestsController> {
  const UploadRequestsScreen({super.key});


  static const _name = '/upload_requests';
  static final page = GetPage(
      name: _name,
      page: () => const UploadRequestsScreen(),
      binding: UploadRequestsBinding()
  );

  static void navigate(int groupId) =>
      Get.toNamed(_name, arguments: groupId);

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
              title: Text("Upload Requests"),
            ),
            GetBuilder<UploadRequestsController>(
                builder: (_){
                  if(controller.state.status.isSuccess){
                    var data = controller.state.data!;
                    return SliverList.builder(
                        itemCount: data.length,
                        itemBuilder: (_,i)=> Card(
                          child: ListTile(
                            title: Text(data[i].fileName),
                            subtitle: InkWell(
                              child: Text(
                                  data[i].temporaryPath,
                                style: TextStyle(
                                    color: Colors.blue
                                ),
                              ),
                              onTap: (){
                                // TODO download
                              },
                            ),
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
