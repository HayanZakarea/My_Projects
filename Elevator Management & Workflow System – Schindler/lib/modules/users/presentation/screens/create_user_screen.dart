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
import 'package:elevator_management_app/modules/users/presentation/controller/create_user/create_user_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/create_user/create_user_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/permissions_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/roles_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class CreateUserScreen extends GetView<CreateUserController> {
  const CreateUserScreen({super.key});

  static const name = '/create_user';
  static final page = GetPage(
      name: name,
      page: () => const CreateUserScreen(),
      binding: CreateUserBinding(),
      middlewares: [
        UserPermissions().getMiddleware('user.create')
      ]
  );

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE USER"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            AppTextFormField(
              hint: "User name",
              controller: controller.nameController,
            ),
            AppTextFormField(
              hint: "User email",
              controller: controller.emailController,
            ),
            AppTextFormField(
              hint: "User password",
              controller: controller.passwordController,
              isPass: true,
            ),
            SizedBox(
              height: 2.5.vmin,
            ),
            GetBuilder<CreateUserController>(
                builder: (_) => Card(
                child: ListTile(
                  title: Text("ROLES : ${controller.roles.length}"),
                  subtitle: Text("selected : ${controller.roles.map((e) => e.name).join(" , ")}"),
                  onTap: ()=> RolesScreen.navigateWithSelector(controller.selectAndUnSelect),
                ),
              )
            ),
            SizedBox(
              height: 2.5.vmin,
            ),
            SubmitButton(
              onTap: controller.sendData,
            ).paddingSymmetric(horizontal: 25.w)
          ]),
        ],
      ).paddingSymmetric(vertical: 2.5.vmin, horizontal: 7.5.vmin),
    );
  }
}
