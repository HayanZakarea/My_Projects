import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/core_components/app_text_form_field.dart';
import '../../../../core/core_components/submit_button.dart';
import '../../../../core/permissions/user_permissions.dart';
import '../../../users/presentation/screens/roles_screen.dart';
import '../controller/create_order_type/create_order_type_binding.dart';
import '../controller/create_order_type/create_order_type_controller.dart';
import 'add_step_screen.dart';

class CreateOrderTypeScreen extends GetView<CreateOrderTypeController> {
  const CreateOrderTypeScreen({super.key});

  static const name = '/create_order_type';
  static final page = GetPage(
      name: name,
      page: () => const CreateOrderTypeScreen(),
      binding: CreateOrderTypeBinding(),
      middlewares: [
        UserPermissions().getMiddleware('order_type.create')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE ORDER TYPE"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.5.vmin),
        child: CustomScrollView(
          slivers: [
            SliverList.list(children: [
              AppTextFormField(
                hint: 'name',
                controller: controller.nameController,
              ),

              SubmitButton(
                  onTap: controller.sendData,
                  label: "Create"
              ),
              const Divider(),
              ListTile(
                title: Text("Steps : "),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _showCreateStep,
                ),
              ),
            ]),
            Obx(() =>
                SliverList.builder(
                    itemCount: controller.steps.length,
                    itemBuilder: (_,i) => ListTile(
                      title: Text(controller.steps[i].name),
                      subtitle: Text(controller.steps[i].reportValues.join(", ")),
                    )
                )),
          ],
        ),
      ),
    );
  }

  void _showCreateStep() {
    controller.selectedRole.value = null;
    Get.toNamed(AddStepScreen.name);
  }

}
