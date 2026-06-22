import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';
import 'package:elevator_management_app/modules/catalog/presentation/components/catalog_view.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/create_cataog_screen.dart';
import 'package:elevator_management_app/modules/forms/presentation/components/form_view.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/forms/forms_binding.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/forms/forms_controller.dart';
import 'package:elevator_management_app/modules/forms/presentation/screens/create_form_screen.dart';

class FormsScreen extends GetView<FormsController> {
  const FormsScreen({super.key});

  static const name = '/forms';
  static final page = GetPage(
      name: name,
      page: () => const FormsScreen(),
      binding: FormBinding(),
      middlewares:[
        UserPermissions().getMiddleware('form.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
      ),

      body: GetBuilder<FormsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> FormView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: Visibility(
        visible: UserPermissions().has('form.create'),
        child: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline),
          onPressed: ()=> Get.toNamed(CreateFormScreen.name),
        ),
      ),
    );
  }
}
