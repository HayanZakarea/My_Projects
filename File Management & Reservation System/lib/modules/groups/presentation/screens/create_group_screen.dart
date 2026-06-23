import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_app/core/core_components/app_text_form_field.dart';
import 'package:web_app/modules/groups/presentation/controller/create_group/create_group_binding.dart';
import 'package:web_app/modules/groups/presentation/controller/create_group/create_group_controller.dart';

class CreateGroupScreen extends GetView<CreateGroupController> {
  const CreateGroupScreen({super.key});


  static const name = '/create_group';
  static final page = GetPage(
    name: name,
    page: () => const CreateGroupScreen(),
    binding: CreateGroupBinding()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade300
              ]
          ),
        ),
        child: SingleChildScrollView(
            padding: EdgeInsets.all(2.5.vmin),
            child: Column(
              children: [
                Text(
                    "Create a New Group",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                ),
                SizedBox(
                  height: 12.5.vmin,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w
                  ),
                  child: AppTextFormField(
                    hint: 'Group Name',
                    icon: Icon(Icons.groups),
                    controller: controller.nameController,
                  ),
                ),
                SizedBox(
                  height: 12.5.vmin,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.5.vmin)
                      ),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600
                      )
                    ),
                    onPressed: controller.sendData,
                    child: Text("Create")
                )
              ],
            )
        ),
      ),
    );
  }
}
