import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/responsive_utils.dart';
import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/presentation/components/permission_view.dart';
import 'package:elevator_management_app/modules/users/presentation/components/role_view.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/create_role/create_role_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/create_role/create_role_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/permissions_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class CreateRoleScreen extends GetView<CreateRoleController> {
  const CreateRoleScreen({super.key});

  static const name = '/create_role';
  static final page = GetPage(
      name: name,
      page: () => const CreateRoleScreen(),
      binding: CreateRoleBinding(),
      middlewares: [
        UserPermissions().getMiddleware('role.create')
      ]
  );

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE ROLE"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            AppTextFormField(
              hint: "Role name",
              controller: controller.nameController,
            ),
            SizedBox(
              height: 2.5.vmin,
            ),
            GetBuilder<CreateRoleController>(
              builder: (_) {
                return ListTile(
                  title: const Text('Selected permissions'),
                  subtitle: Text("Selected : ${controller.permissions.length}"),
                  onTap: (){
                    PermissionScreen.navigateWithSelector(controller.selectAndUnSelect);
                  },
                );
              }
            ),
            SizedBox(
              height: 2.5.vmin,
            ),
            SubmitButton(
              onTap: controller.sendData,
            ).paddingSymmetric(
              horizontal: 25.vmin
            )
          ]),

        ],
      ).paddingAll(2.5.vmin),
    );
  }
}
