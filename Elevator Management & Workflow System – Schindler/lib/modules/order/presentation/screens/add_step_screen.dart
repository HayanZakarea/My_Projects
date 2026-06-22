import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/core_components/app_text_form_field.dart';
import '../../../../core/permissions/user_permissions.dart';
import '../../../users/presentation/screens/roles_screen.dart';
import '../controller/create_order_type/create_order_type_controller.dart';

class AddStepScreen extends GetView<CreateOrderTypeController> {
  const AddStepScreen({super.key});

  static const name = '/add_step';
  static final page = GetPage(
      name: name,
      page: () => const AddStepScreen(),
      middlewares: [
        UserPermissions().getMiddleware('order_type.create')
      ]
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.5.vmin),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.list(children: [
                    AppTextFormField(
                      hint: 'name',
                      controller: controller.stepNameController,
                    ),
                    ListTile(
                      title: Obx(
                              () =>
                              Text(controller.selectedRole.value?.name ??
                                  'not selected')
                      ),
                      onTap: () =>
                          RolesScreen.navigateWithSelector((value){
                            controller.selectedRole.value = null;
                            controller.selectedRole(value);
                          }),
                    ),
                    Obx(() =>
                        CheckboxListTile(
                          value: controller.hasReport.value,
                          onChanged: (value) => controller.hasReport(value),
                          title: Text("has report"),
                        )
                    ),
                    Obx(() =>
                        CheckboxListTile(
                          value: controller.canUpdate.value,
                          onChanged: (value) => controller.canUpdate(value),
                          title: Text("can update"),
                        ),
                    ),
                    ListTile(
                      title: Text('arrangement'),
                      subtitle: Text("${controller.steps.length + 1}"),
                    ),
                    Obx(
                            () =>
                            Visibility(
                                visible: controller.hasReport.value,
                                child: ListTile(
                                  title: Text("Add report"),
                                  onTap: _createReport,
                                )
                            )
                    ),
                    Obx(
                            () =>
                            Visibility(
                                visible: controller.hasReport.value,
                                child: ListTile(
                                  title: Text("Reports :"),
                                )
                            )
                    )
                  ]),
                  Obx(() =>
                      SliverList.builder(
                          itemCount: controller.reportValues.length,
                          itemBuilder: (_,i) => ListTile(
                            subtitle: Text(controller.reportValues[i]),
                          )
                      )
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: (){
                if(controller.addStep()){
                  Get.back();
                }
              },
            )
          ],
        ),
      ),
    );
  }


  void _createReport() {
    final reportController = TextEditingController();
    showDialog(
        context: Get.context!,
        builder: (_) =>
            Dialog(
              child: Padding(
                  padding: EdgeInsets.all(2.5.vmin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFormField(
                        hint: 'report title',
                        controller: reportController,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      ElevatedButton(
                          onPressed:(){
                            if(reportController.text.trim().isNotEmpty){
                              controller.reportValues.add(reportController.text.trim());
                              Get.back();
                            }
                          },
                          child: Text("Add")
                      )
                    ],
                  )
              ),
            )
    );
  }
}
