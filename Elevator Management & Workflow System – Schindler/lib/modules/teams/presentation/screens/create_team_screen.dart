import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/validator.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_controller.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/create_catalog/create_part_binding.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/create_catalog/create_part_controller.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/create_team/create_team_binding.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/create_team/create_team_controller.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/users/users_controller.dart';

import '../../../../core/permissions/user_permissions.dart';

class CreateTeamScreen extends GetView<CreateTeamController> {
  static const name = '/create_team';
  static final page = GetPage(
      name: name,
      page: () => const CreateTeamScreen(),
      binding: CreateTeamBinding(),
      middlewares: [UserPermissions().getMiddleware('part.create')]);

  const CreateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE TEAM"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.5.vmin),
        child: SingleChildScrollView(
            child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              AppTextFormField(
                hint: 'name',
                icon: Icon(Icons.title),
                controller: controller.nameController,
                validator: Validator.requiredText,
              ),
              Card(
                margin: EdgeInsets.zero,
                child: Obx(
                  () => ListTile(
                    title: Text(controller.leader.value?.name ?? 'Click to Select User'),
                    onTap: _selectUser,
                  ),
                ),
              ),
              SubmitButton(
                onTap: controller.sendData,
              )
            ]
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.vmin),
                      child: e,
                    ))
                .toList(),
          ),
        )),
      ),
    );
  }

  void _selectUser() => showDialog(
      context: Get.context!,
      builder: (_)=> Dialog(
        child: GetBuilder<UsersController>(
          builder: (c) => StateComponent(
              state: c.state,
              onSuccess: (_,data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_,i) => ListTile(
                    title: Text(data[i].name),
                    subtitle: Text(data[i].email),
                    onTap: (){
                      Get.back();
                      controller.leader(data[i]);
                    },
                  )
              ),
          ),
        )
      )
  );

}
