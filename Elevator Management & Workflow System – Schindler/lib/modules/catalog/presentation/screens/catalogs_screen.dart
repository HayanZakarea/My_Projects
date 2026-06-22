import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/catalog/presentation/components/catalog_view.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/create_cataog_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class CatalogsScreen extends GetView<CatalogsController> {
  const CatalogsScreen({super.key});

  static const name = '/catalogs';
  static final page = GetPage(
      name: name,
      page: () => const CatalogsScreen(),
      binding: CatalogsBinding(),
      middlewares:[
        UserPermissions().getMiddleware('catalog.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CATALOGS"),
      ),

      body: GetBuilder<CatalogsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> CatalogView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: Visibility(
        visible: UserPermissions().has('catalog.create'),
        child: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline),
          onPressed: ()=> Get.toNamed(CreateCatalogScreen.name),
        ),
      ),
    );
  }
}
