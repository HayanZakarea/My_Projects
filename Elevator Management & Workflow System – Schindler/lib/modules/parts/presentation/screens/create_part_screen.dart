import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/validator.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_controller.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/create_catalog/create_part_binding.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/create_catalog/create_part_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
class CreatePartScreen extends GetView<CreatePartController> {

  static const name = '/create_part';
  static final page = GetPage(
      name: name,
      page: () => const CreatePartScreen(),
      binding: CreatePartBinding(),
      middlewares:[
        UserPermissions().getMiddleware('part.create')
      ]
  );


  const CreatePartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE PART"),
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
                  AppTextFormField(
                    hint: 'price',
                    icon: Icon(Icons.price_check),
                    maxLines: 3,
                    validator: Validator.requiredInt,
                    controller: controller.priceController
                  ),
                  AppTextFormField(
                    hint: 'wholesale price',
                    icon: Icon(Icons.price_check),
                    validator: Validator.requiredInt,
                    controller: controller.wholesalePriceController
                  ),
                  AppTextFormField(
                    hint: 'count',
                    icon: Icon(Icons.price_check),
                    validator: Validator.requiredInt,
                    controller: controller.countController
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      title: const Text("Nationality"),
                      leading: Obx(
                              ()=> Visibility(
                                  visible: controller.isNationality.value,
                                  replacement: const Icon(Icons.check_box_outline_blank),
                                  child: const Icon(Icons.check_box_outlined),
                              )
                      ),
                      onTap: () => controller.isNationality(controller.isNationality.isFalse),
                    ),
                  ),

                  SubmitButton(
                    onTap: controller.sendData,
                  )
                ].map(
                        (e) => Padding(
                            padding:EdgeInsets.symmetric(vertical: 1.vmin),
                            child: e,
                        )).toList(),
              ),
            )
        ),
      ),
    );
  }

}
