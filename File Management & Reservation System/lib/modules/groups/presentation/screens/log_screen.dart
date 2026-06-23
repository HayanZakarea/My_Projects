import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/data_state/data_state.dart';
import 'package:web_app/modules/groups/presentation/controller/log_controller/log_binding.dart';
import 'package:web_app/modules/groups/presentation/controller/log_controller/log_controller.dart';
import 'package:intl/intl.dart';


class LogScreen extends GetView<LogController> {
  const LogScreen({super.key});

  static const _name = '/logs';

  static final page = GetPage(
      name: _name,
      page: () => const LogScreen(),
      binding: LogBinding()
  );

  static void navigateUser(int groupId,int userId)=>
    Get.toNamed(_name,arguments: {
      'group':groupId,
      'user':userId
    });

  static void navigateFile(int groupId,int fileId)=>
      Get.toNamed(_name,arguments: {
        'group':groupId,
        'file':fileId
      });


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
              title: Text("Logs"),
            ),
            GetBuilder<LogController>(
                builder: (_){
                  if(controller.state.status.isSuccess){
                    var data = controller.state.data!;
                    return SliverList.builder(
                        itemCount: data.length,
                        itemBuilder: (_,i)=> Card(
                          child: ListTile(
                            leading: Icon(Icons.file_copy_outlined),
                            title: Text('''user : ${data[i].user.name}
file : ${data[i].file.name}
operation : ${data[i].operationType}
description : ${data[i].operationDescription}'''),
     subtitle: Text('${DateFormat().format(data[i].createdAt)}'),
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
