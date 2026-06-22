
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/data/models/order_type_model.dart';

class CheckStepController extends LoadDataController<StepModel> {

  final OrderModel model;


  CheckStepController(this.model);

  @override
  Future<StepModel> apiCall() => OrderDataSource.getOrderStep(model.id);

}