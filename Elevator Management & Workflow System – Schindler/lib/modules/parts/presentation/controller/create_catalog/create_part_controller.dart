
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/file_handler/file_picker_handler.dart';
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

import 'package:get/get.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/catalogs/catalogs_controller.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/presentation/controller/parts/parts_controller.dart';

class CreatePartController extends SendDataController{
  @override
  Future apiCall() => PartsDataSource.createPart(
      name: nameController.text,
      price: int.parse(priceController.text),
      wholesalePrice: int.parse(wholesalePriceController.text),
      count: int.parse(countController.text),
      isNationality: isNationality.value
  );

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final wholesalePriceController = TextEditingController();
  final countController = TextEditingController();
  final videosController = TextEditingController();
  final RxBool isNationality = false.obs;

  @override
  void onSuccess() {
    super.onSuccess();
    Get.back();
    Get.find<PartsController>().loadData();
  }


}