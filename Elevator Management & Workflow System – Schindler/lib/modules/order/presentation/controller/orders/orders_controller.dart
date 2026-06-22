
import 'package:elevator_management_app/modules/catalog/data/data_source/catalog_data_source.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';

import '../../../../../core/base_controller/load_data_controller.dart';
import '../../../data/models/order_model.dart';

class OrdersController extends LoadDataController<List<OrderModel>>{
  @override
  Future<List<OrderModel>> apiCall() => OrderDataSource.getOrders();

}