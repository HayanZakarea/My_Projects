import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/responsive_utils.dart';
import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/presentation/components/permission_view.dart';
import 'package:elevator_management_app/modules/users/presentation/components/role_view.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/create_role_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class RolesInfoScreen extends StatelessWidget {
  const RolesInfoScreen(this.model,{super.key});

  final RoleModel model;
  static const _name = '/role_info';
  static final page = GetPage(
      name: _name,
      page: () => RolesInfoScreen(Get.arguments),
      middlewares: [
        UserPermissions().getMiddleware('role.index')
      ]
  );

  static void navigate(RoleModel model) =>
      Get.toNamed(_name,arguments: model);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ROLE : ${model.name}"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
              children: [
                Card(
                  child: ListTile(
                    title: Text(model.name),
                    subtitle: Text('permissions : ${model.permissions.length}'),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(1.25.vmin),
                  child: Text(
                      "Permissions :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.maxSpa(22)
                      ),
                  ),
                ),
                const Divider(),
              ]
          ),
          SliverList.builder(
              itemCount: model.permissions.length,
              itemBuilder: (_,i)=> PermissionView(
                  model: model.permissions[i]
              )
          )
        ],
      ),

    );
  }
}
