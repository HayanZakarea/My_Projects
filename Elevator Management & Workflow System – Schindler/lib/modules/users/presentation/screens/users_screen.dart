import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/responsive_utils.dart';
import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
import 'package:elevator_management_app/modules/users/presentation/components/permission_view.dart';
import 'package:elevator_management_app/modules/users/presentation/components/role_view.dart';
import 'package:elevator_management_app/modules/users/presentation/components/user_view.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/create_user_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class UserScreen extends GetView<UsersController> {
  const UserScreen({super.key});

  static const name = '/users';
  static final page = GetPage(
      name: name,
      page: () => const UserScreen(),
      binding: UsersBinding(),
      middlewares:[
        UserPermissions().getMiddleware('user.index')
      ]
  );

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("USERS"),
      ),

      body: GetBuilder<UsersController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> UserView(model: data[i]),
              ),
            );
          }
      ),

      floatingActionButton: Visibility(
        visible: UserPermissions().has('user.create'),
        child: FloatingActionButton(
          onPressed: ()=> Get.toNamed(CreateUserScreen.name),
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }
}
