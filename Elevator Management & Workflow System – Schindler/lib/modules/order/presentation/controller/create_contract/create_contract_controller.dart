import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';
import 'package:elevator_management_app/core/data_state/exception_handler.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/data/models/value_send_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_controller.dart';

class CreateContractController extends SendDataController<void> {
  @override
  Future<void> apiCall() => OrderDataSource.createContract(
      clientId: selectedClient!.id,
      values: values.values,
      title: titleController.text,
      description: descriptionController.text,
      numOfElevators: int.parse(numOfElevatorsController.text),
      numOfPayments: int.parse(numOfPaymentsController.text),
      price: int.parse(priceController.text),
      from: from.value,
      to: to.value,
      units: selectedUnits.map((e) => e.id)
  );

  Map<int, ValueSendModel> values = {};

  final RxSet<UnitModel> selectedUnits = RxSet();

  void selectValue(ValueSendModel model, int id) {
    values[id] = model;
    update();
  }

  ClientModel? _selectedClient;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final numOfElevatorsController = TextEditingController();
  final numOfPaymentsController = TextEditingController();
  final priceController = TextEditingController();

  final Rx<DateTime> from = DateTime.now().obs;
  final Rx<DateTime> to = DateTime.now().obs;



  ClientModel? get selectedClient => _selectedClient;

  void select(ClientModel model) {
    _selectedClient = model;
    loadUnits();
    update();
  }

  @override
  void onSuccess() {
    super.onSuccess();
    Get.find<ContractsController>().loadData();
    Get.back();
  }

  List<Worker> _workers = [];

  @override
  void onInit() {
    super.onInit();
    _workers.add(ever(selectedUnits, (callback) => update()));
  }

  @override
  void onClose() {
    _workers.forEach((e) => e.dispose());
    super.onClose();
  }


  DataState<List<UnitModel>> _unitsState = const DataState();

  void loadUnits()async{
    if(_selectedClient == null) return;
    _unitsState = const DataState();
    _unitsState = await handle(() => OrderDataSource.getClientUnit(_selectedClient!.id));
    update();
  }

  DataState<List<UnitModel>> get unitsState => _unitsState;


}
