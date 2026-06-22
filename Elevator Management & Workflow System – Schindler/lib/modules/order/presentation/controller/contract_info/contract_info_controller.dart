
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';

import '../../../../../core/base_controller/load_data_controller.dart';

class ContractInfoController extends LoadDataController<ContractModel>{

  final ContractModel model;


  ContractInfoController(this.model);

  @override
  Future<ContractModel> apiCall() => OrderDataSource.getContractById(model.id);

}