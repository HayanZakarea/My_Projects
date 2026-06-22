
import 'package:flutter/cupertino.dart';
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';

class ClientController extends LoadDataController<List<ClientModel>>{
  @override
  Future<List<ClientModel>> apiCall() =>
      UsersDataSource.getAllClients();

  final ValueChanged<ClientModel>? _select;

  ClientController(this._select);

  ClientModel? _selected;


  ClientModel? get selected => _selected;

  ValueChanged<ClientModel>? get select => _select != null ? (val){
    _select!(val);
    _selected = val;
    update();
  }:null;


}