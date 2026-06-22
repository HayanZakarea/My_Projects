import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/validator.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_controller.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/create_form/create_form_controller.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/create_form/create_from_binding.dart';

import '../../../../core/permissions/user_permissions.dart';
class CreateFormScreen extends GetView<CreateFormController> {

  static const name = '/create_form';
  static final page = GetPage(
      name: name,
      page: () => const CreateFormScreen(),
      binding: CreateFormBinding(),
      middlewares:[
        UserPermissions().getMiddleware('form.create')
      ]
  );


  const CreateFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE FORM"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.5.vmin),
        child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    hint: 'Question',
                    icon: Icon(Icons.question_mark),
                    controller: controller.questionController,
                    validator: Validator.requiredText,
                  ),
                  AppTextFormField(
                    hint: 'description',
                    icon: Icon(Icons.description_outlined),
                    maxLines: 3,
                    validator: Validator.requiredText,
                    controller: controller.descriptionController
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

  Widget _image(PlatformFile file) =>
      Container(
        width: 17.5.vmin,
        margin: EdgeInsets.all(1.25.vmin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.25.vmin),
          image: DecorationImage(
            image: MemoryImage(file.bytes!),
            fit: BoxFit.cover
          )
        ),
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            child: Icon(Icons.delete),
          ),
          onPressed: () => controller.removeImage(file),
        ),
      );
}
