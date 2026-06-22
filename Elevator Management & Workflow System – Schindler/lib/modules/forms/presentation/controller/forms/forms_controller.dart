
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/forms/data/data_source/forms_data_source.dart';
import 'package:elevator_management_app/modules/forms/data/models/from_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';

class FormsController extends LoadDataController<List<FormModel>>{
  @override
  Future<List<FormModel>> apiCall() => FormsDataSource.getForms();

}