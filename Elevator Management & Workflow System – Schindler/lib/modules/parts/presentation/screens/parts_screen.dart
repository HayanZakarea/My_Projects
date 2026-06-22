import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/catalog/presentation/components/catalog_view.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/create_cataog_screen.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_binding.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
import '../components/part_view.dart';
import 'create_part_screen.dart';

class PartsScreen extends GetView<PartsController> {
  const PartsScreen({super.key});

  static const name = '/parts';
  static final page = GetPage(
      name: name,
      page: () => const PartsScreen(),
      binding: PartsBinding(),
      middlewares:[
        UserPermissions().getMiddleware('part.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("PARTS"),
      ),

      body: GetBuilder<PartsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> PartView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: Visibility(
        visible: UserPermissions().has('part.create'),
        child: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline),
          onPressed: ()=> Get.toNamed(CreatePartScreen.name),
        ),
      ),
    );
  }
}
