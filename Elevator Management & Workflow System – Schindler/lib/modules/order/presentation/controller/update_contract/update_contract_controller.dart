
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/base_controller/send_data_controller.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';
import 'package:elevator_management_app/core/data_state/exception_handler.dart';
import 'package:elevator_management_app/modules/order/data/data_source/order_data_source.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/data/models/value_send_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_controller.dart';

import '../contract_info/contract_info_controller.dart';
class UpdateContractController extends SendDataController<void>{


  final ContractModel model;


  UpdateContractController(this.model);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final numOfElevatorsController = TextEditingController();
  final numOfPaymentsController = TextEditingController();
  final priceController = TextEditingController();

  final Rxn<DateTime> from = Rxn();
  final Rxn<DateTime> to = Rxn();

  final RxSet<UnitModel> selectedUnits = RxSet();
  final RxList<ValueSendModel> addedValues = RxList();


  List<Worker> _workers = [];

  @override
  void onInit() {
    super.onInit();
    titleController.text = model.title ?? '';
    descriptionController.text = model.description ?? '';
    numOfElevatorsController.text = model.numOfElevators?.toString() ?? '';
    numOfPaymentsController.text = model.numOfPayments?.toString() ?? '';
    priceController.text = model.price?.toString() ?? '';
    from(model.from);
    to(model.to);
    selectedUnits.addAll(model.units);
    _workers.add(ever(selectedUnits, (callback) => update()));
    _workers.add(ever(addedValues, (callback) => update()));
  }

  @override
  void onReady() {
    super.onReady();
    loadUnits();
  }

  @override
  void onClose() {
    _workers.forEach((e) => e.dispose());
    super.onClose();
  }

  @override
  Future<void> apiCall() =>
    OrderDataSource.updateContract(
        id: model.id,
        title: titleController.text,
        description: descriptionController.text,
        numOfElevators: int.tryParse(numOfElevatorsController.text),
        numOfPayments: int.tryParse(numOfPaymentsController.text),
        price: int.tryParse(priceController.text),
        from: from.value,
        to: to.value,
        units: selectedUnits.map((e) => e.id)
    );

  DataState<List<UnitModel>> _unitsState = const DataState();

  void loadUnits()async{
    if(model.clientId == null) return;
    _unitsState = const DataState();
    _unitsState = await handle(() => OrderDataSource.getClientUnit(model.clientId!));
    update();
  }

  DataState<List<UnitModel>> get unitsState => _unitsState;

  @override
  void onSuccess(){
    super.onSuccess();
    Get.find<ContractInfoController>().loadData();
    Get.find<ContractsController>().loadData();
    Get.back();
  }

}