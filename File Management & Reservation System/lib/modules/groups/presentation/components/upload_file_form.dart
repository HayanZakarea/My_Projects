import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_app/modules/groups/presentation/controller/group_info/group_info_ontroller.dart';

class UploadFileForm extends GetView<GroupInfoController> {
  final int? fileCheckOut;
  const UploadFileForm({super.key,this.fileCheckOut});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 25.vmin,
        vertical: 10.vmin
      ),
      child: Container(
        child: GetBuilder<GroupInfoController>(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: ListTile(
                    title: Text(controller.selectedFile?.name ?? 'no file selected'),
                    onTap: controller.selectFile,
                    trailing: Icon(Icons.file_copy_outlined),
                  ),
                ),
                SizedBox(
                  height: 5.vmin,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.selectedFile != null ? null : Colors.grey
                    ),
                    onPressed: ()=>controller.uploadFile(fileCheckOut),
                    child: Text("Upload")
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
