import 'dart:developer';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/modules/order/data/models/order_type_model.dart';
import 'package:elevator_management_app/modules/order/data/models/value_send_model.dart';

import '../models/order_model.dart';
import '../models/step_send_model.dart';

class OrderDataSource {

  static Future<void> createOrderType({
    required String name,
    required List<StepSendModel> steps
}) => NetworkHandler().post(ApiConst.orderType,data:{
    'name':name,
    'steps':steps.map((e) => e.json).toList()
  });

  static Future<List<OrderModel>> getOrders() async {
    var response = await NetworkHandler().get(ApiConst.order);
    List data = response.data['data']['order'];
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }

  static Future<OrderModel> getOrderById(int id) async {
    var response = await NetworkHandler().get(ApiConst.orderById(id));
    var json = response.data['data']['order'];
    return OrderModel.fromJson(json);
  }

  static Future<List<OrderTypeModel>> getOrderTypes() async {
    var response = await NetworkHandler().get(ApiConst.orderType);
    List data = response.data['data']['order_type'];
    return data.map((e) => OrderTypeModel.fromJson(e)).toList();
  }

  static Future<OrderTypeModel> getOrderTypeById(int id) async {
    var response = await NetworkHandler().get(ApiConst.orderTypeById(id));
    var json = response.data['data']['order_type'];
    return OrderTypeModel.fromJson(json);
  }

  static Future<List<ContractModel>> getContracts() async {
    var response = await NetworkHandler().get(ApiConst.contracts);
    List data = response.data['data']['contract'];
    return data.map((e) => ContractModel.fromJson(e)).toList();
  }

  static Future<List<UnitModel>> getClientUnit(int id) async {
    var response = await NetworkHandler().get(ApiConst.clientById(id));
    List data = response.data['data']['client']['units'];
    return data.map((e) => UnitModel.fromJson(e)).toList();
  }

  static Future<ContractModel> getContractById(int id) async {
    var response = await NetworkHandler().get(ApiConst.contractById(id));
    return ContractModel.fromJson(response.data['data']['contract']);
  }

  static Future<void> updateContract({
    required int id,
    required String title,
    required String description,
    required int? numOfElevators,
    required int? numOfPayments,
    required int? price,
    required DateTime? from,
    required DateTime? to,
    required Iterable<int> units,
  }) async {
    var body = {
      if (title.isNotEmpty) "title": title,
      if (description.isNotEmpty) "description": description,
      "num_of_elevators": numOfElevators,
      "num_of_payments": numOfPayments,
      "from": from?.toIso8601String(),
      "to": to?.toIso8601String(),
      "price": price,
      "units": units.toList(),
      '_method': "PUT"
    };
    body.removeWhere((key, value) => value == null);
    await NetworkHandler().post(ApiConst.contractById(id), data: body);
  }

  static Future<void> createContract({
    required int clientId,
    required Iterable<ValueSendModel> values,
    required String title,
    required String description,
    required int numOfElevators,
    required int numOfPayments,
    required int price,
    required DateTime from,
    required DateTime to,
    required Iterable<int> units,
  }) async {
    await NetworkHandler().post(
        ApiConst.contracts,
        data: {
          'client_id':clientId,
          'values':values.map((e) => e.json).toList(),
          if (title.isNotEmpty) "title": title,
          if (description.isNotEmpty) "description": description,
          "num_of_elevators": numOfElevators,
          "num_of_payments": numOfPayments,
          "from": from.toIso8601String(),
          "to": to.toIso8601String(),
          "price": price,
          "units": units.toList(),
        });
  }



  static Future<StepModel> getOrderStep(int id) async {
    var response = await NetworkHandler().get(ApiConst.checkStep(id));
    return StepModel.fromJson(response.data['data']['step']);
  }



  static Future<void> setStep({
    required int orderId,
    required int stepId,
    required Map<int, String> values,
    required String report,
  }) =>
      NetworkHandler().post(ApiConst.orderStep, data: {
        'order_id': orderId,
        'step_id': stepId,
        for (int i = 0; i < values.keys.length; i++) ...{
          'values[$i][step_report_value_id]': values.keys.toList()[i],
          'values[$i][value]': values[values.keys.toList()[i]],
        },
        'report': report
      });
}
