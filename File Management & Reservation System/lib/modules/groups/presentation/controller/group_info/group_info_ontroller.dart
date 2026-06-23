import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/core/base_controller/load_data_controller.dart';
import 'package:web_app/core/const/api_const.dart';
import 'package:web_app/core/data_state/exception_handler.dart';
import 'package:web_app/core/file_handler/file_picker_handler.dart';

import '../../../../../core/storage/storage_handler.dart';
import '../../../data/data_source/groups_data_source.dart';
import '../../../data/model/group_info_model.dart';
import '../../components/upload_file_form.dart';

class GroupInfoController extends LoadDataController<(List<FileModel>,bool)> {
  final int groupId;

  GroupInfoController(this.groupId);

  bool get isAdmin => state.isSuccess && state.data!.$2;

  @override
  Future<(List<FileModel>,bool)> apiCall() => GroupsDataSource.getMyFiles(groupId);

  PlatformFile? _selectedFile;

  PlatformFile? get selectedFile => _selectedFile;

  void selectFile() async {
    _selectedFile = await FilePickerHandler.getFile();
    update();
  }



  void floatingAction() {
    if(!hasCheckedFiles)
      showUploadFileForm();
    else
      checkIn();
  }

  void showUploadFileForm([int? id]) {
    _selectedFile = null;
    Get.dialog( UploadFileForm(fileCheckOut: id,));
  }



  void checkIn() async {
    if(!hasCheckedFiles)
      return;
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var res = await handle(() => GroupsDataSource.checkIn(_selectedFiles.toList(),groupId));
    Get.back();
    if(res.isSuccess){
      loadData();
      return;
    }
    Get.snackbar("Error", res.message);

  }




  void uploadFile([int? checkOutId]) async {
    if(selectedFile == null)
      return;
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var res = await handle(() => checkOutId != null ? GroupsDataSource.checkOut(checkOutId, selectedFile!):
    GroupsDataSource.uploadFile(groupId, selectedFile!));
    Get.back();
    if(res.isSuccess){
      loadData();
      return;
    }
    Get.snackbar("Error", res.message);

  }

  void deleteFile(int fileId) async {

    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var res = await handle(
            () =>  GroupsDataSource.deleteFile(groupId, fileId)
    );
    Get.back();
    if(res.isSuccess){
      loadData();
      return;
    }
    Get.snackbar("Error", res.message);

  }

  final Set<int> _selectedFiles = {};

  bool isSelected(FileModel file){
    return _selectedFiles.contains(file.id);
  }

  bool get hasCheckedFiles => _selectedFiles.isNotEmpty;

  void checkFile(FileModel file){
    if(isSelected(file)){
      _selectedFiles.remove(file.id);
    }else{
      _selectedFiles.add(file.id);
    }
    update();
  }

  void downloadFile(FileModel file)async{
    await launchUrl(Uri.parse(ApiConst.download(file.id)),
      webViewConfiguration: WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
        headers: {
          if(StorageHandler().hasToken)
            'Authorization':'Bearer ${StorageHandler().token}'
        }
      ),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: 'Download'
    );
    // await Dio(
    //   BaseOptions(
    //     headers: {
    //           if(StorageHandler().hasToken)
    //             'Authorization':'Bearer ${StorageHandler().token}'
    //         }
    //   )
    // ).download(ApiConst.download(file.id), 'C:\\Users\\HP\\Downloads\\');
  }
}
