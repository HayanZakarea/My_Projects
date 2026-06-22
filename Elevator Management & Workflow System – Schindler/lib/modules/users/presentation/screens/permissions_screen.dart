  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:responsive_sizer/responsive_sizer.dart';
  import 'package:elevator_management_app/core/core_components/state_component.dart';
  import 'package:elevator_management_app/core/core_components/submit_button.dart';
  import 'package:elevator_management_app/core/utils/responsive_utils.dart';
  import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
  import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
  import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
  import 'package:elevator_management_app/modules/users/presentation/components/permission_view.dart';
  import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
  import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';

import '../../../../core/permissions/user_permissions.dart';

  class PermissionScreen extends GetView<PermissionsController> {
    const PermissionScreen({super.key});

    static const name = '/permission';
    static final page = GetPage(
      name: name,
      page: () => const PermissionScreen(),
      binding: PermissionBinding(),
      middlewares:[
          UserPermissions().getMiddleware('permission.index')
      ]
    );

    static void navigateWithSelector(ValueChanged<PermissionModel> select){
      Get.toNamed(name,arguments: select);
    }

    @override
    Widget build(BuildContext context) {
      MediaQuery.of(context);
      return Scaffold(
        appBar: AppBar(
          title: Text("PERMISSIONS"),
        ),

        body: GetBuilder<PermissionsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> PermissionView(model: data[i]),
              ),
            );
          }
        ),
      );
    }
  }
