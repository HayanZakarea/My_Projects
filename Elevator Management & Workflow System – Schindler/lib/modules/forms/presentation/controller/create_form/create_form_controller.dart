
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/file_handler/file_picker_handler.dart';
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

import 'package:get/get.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';

class CreateFormController extends SendDataController{
  @override
  Future apiCall() => CatalogDataSource.createCatalog(
      title: questionController.text,
      description: descriptionController.text,
      price: int.parse(priceController.text),
      videos: videosController.text.split(","),
      images: _selectedImages.map((e) => e.bytes!).toList(),
  );

  final questionController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final videosController = TextEditingController();

  final Set<PlatformFile> _selectedImages = {};

  final List<PlatformFile> selectedImages = [];

  void selectImages()async{
    var images = await FilePickerHandler.getImages();
    _selectedImages.addAll(images);
    selectedImages
      ..clear()
      ..addAll(_selectedImages);
    update();
  }

  void removeImage(PlatformFile file) {
      _selectedImages.remove(file);
      selectedImages
        ..clear()
        ..addAll(_selectedImages);
      update();
  }

  void removeAllImages() {
    _selectedImages.clear();
    selectedImages.clear();
    update();
  }

  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<CatalogsController>().loadData();
  }


}