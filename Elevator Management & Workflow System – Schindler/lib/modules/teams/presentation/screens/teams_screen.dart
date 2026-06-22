import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';

import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_binding.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_controller.dart';
import 'package:elevator_management_app/modules/teams/presentation/components/team_view.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/teams/teams_binding.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/teams/teams_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
import 'create_team_screen.dart';

class TeamsScreen extends GetView<TeamsController> {
  const TeamsScreen({super.key});

  static const name = '/teams';
  static final page = GetPage(
      name: name,
      page: () => const TeamsScreen(),
      binding: TeamsBinding(),
      middlewares:[
        UserPermissions().getMiddleware('team.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
      ),

      body: GetBuilder<TeamsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> TeamView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: Visibility(
        visible: UserPermissions().has('team.create'),
        child: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline),
          onPressed: ()=> Get.toNamed(CreateTeamScreen.name),
        ),
      ),
    );
  }
}
