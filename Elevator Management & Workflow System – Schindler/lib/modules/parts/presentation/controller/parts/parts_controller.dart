
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/parts/data/data_source/parts_data_source.dart';
import 'package:elevator_management_app/modules/parts/data/models/part_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';

class PartsController extends LoadDataController<List<PartModel>>{
  @override
  Future<List<PartModel>> apiCall() => PartsDataSource.getParts();

}