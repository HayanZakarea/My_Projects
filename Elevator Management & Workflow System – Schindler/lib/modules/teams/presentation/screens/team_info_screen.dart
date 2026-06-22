import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/utils/dates_format.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/team_info/team_info_binding.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/team_info/team_info_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
import '../components/visit_view.dart';
import 'create_visit_screen.dart';

class TeamInfoScreen extends GetView<TeamInfoController> {
  const TeamInfoScreen({super.key});

  static const _name = '/team_info';
  static final page = GetPage(
      name: _name,
      page: () => const TeamInfoScreen(),
      binding: TeamInfoBinding(),
      middlewares:[
        UserPermissions().getMiddleware('team.index')
      ]
  );

  static void navigate(TeamModel model) =>
      Get.toNamed(_name,arguments: model);



  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Team : ${controller.model.name}"),
      ),

      body: GetBuilder<TeamInfoController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => CustomScrollView(
                slivers: [
                  SliverList.list(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(data.name),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Visits :"),
                          trailing: IconButton(
                            onPressed: () => CreateVisitScreen.navigate(data),
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ]
                  ),
                  SliverList.builder(
                      itemCount: data.visits.length,
                      itemBuilder: (_,i) => VisitView(data.visits[i])
                  ),
                ],
              ),

            );
          }
      ),
    );
  }
}
