import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/utils/validator.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
class CreateCatalogScreen extends GetView<CreateCatalogController> {

  static const name = '/create_catalog';
  static final page = GetPage(
      name: name,
      page: () => const CreateCatalogScreen(),
      binding: CreateCatalogBinding(),
      middlewares:[
        UserPermissions().getMiddleware('catalog.create')
      ]
  );


  const CreateCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE CATALOG"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.5.vmin),
        child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    hint: 'title',
                    icon: Icon(Icons.title),
                    controller: controller.titleController,
                    validator: Validator.requiredText,
                  ),
                  AppTextFormField(
                    hint: 'description',
                    icon: Icon(Icons.description_outlined),
                    maxLines: 3,
                    validator: Validator.requiredText,
                    controller: controller.descriptionController
                  ),
                  AppTextFormField(
                    hint: 'price',
                    icon: Icon(Icons.price_check),
                    validator: Validator.requiredInt,
                    controller: controller.priceController
                  ),
                  AppTextFormField(
                    hint: 'videos : split each url with ,',
                    icon: Icon(Icons.video_camera_back_outlined),
                    maxLines: 3,
                    controller: controller.videosController,
                    validator: (value){
                      if(value?.isEmpty ?? true)
                        return null;
                      var urls = value?.split(",") ?? [];
                      for(var url in urls){
                        if(!url.isURL){
                          return "$url is not a valid url";
                        }
                      }
                    },
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.5.vmin)
                    ),
                    child: GetBuilder<CreateCatalogController>(
                      builder: (_) {
                        return ListTile(
                          leading: const Icon(Icons.image),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_forever),
                            onPressed: controller.removeAllImages,
                          ),
                          title: const Text("Select Images"),
                          subtitle: Text("Selected : ${controller.selectedImages.length}"),
                          onTap: controller.selectImages,
                        );
                      }
                    ),
                  ),
                  GetBuilder<CreateCatalogController>(
                    builder: (_) {
                      return Visibility(
                          visible: controller.selectedImages.isNotEmpty,
                          child: SizedBox(
                            height: 20.vmin,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.selectedImages.length,
                                itemBuilder: (_,i) => _image(controller.selectedImages[i])
                            ),
                          )
                      );
                    }
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
