import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/presentation/components/role_view.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/create_role_screen.dart';

class RolesScreen extends GetView<RolesController> {
  const RolesScreen({super.key});

  static const name = '/roles';
  static final page = GetPage(
      name: name,
      page: () => const RolesScreen(),
      binding: RolesBinding(),
      middlewares: [
        UserPermissions().getMiddleware('role.index')
      ]
  );

  static void navigateWithSelector(ValueChanged<RoleModel> select){
    Get.toNamed(name,arguments: select);
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ROLES"),
      ),
      body: GetBuilder<RolesController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> RoleView(model: data[i]),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(CreateRoleScreen.name),
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
