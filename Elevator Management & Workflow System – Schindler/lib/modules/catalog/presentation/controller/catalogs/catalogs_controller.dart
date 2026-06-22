
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';

class CatalogsController extends LoadDataController<List<CatalogModel>>{
  @override
  Future<List<CatalogModel>> apiCall() => CatalogDataSource.getCatalogs();

}