import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';

import '../data_state/exception_handler.dart';

abstract class LoadDataController<T> extends GetxController {
  DataState<T> _state = const DataState(
      status: DataStatus.loading
  );

  DataState<T> get state => _state;

  Future<T> apiCall();

  Future<void> loadData()async{
    _state = const DataState(
        status: DataStatus.loading
    );
    update();
    _state = await handle(apiCall);
    if(_state.status.isFail)
      onFail();
    else
      onSuccess();
    update();
  }

  void onSuccess(){}
  void onFail(){}



  @override
  void onReady() {
    super.onReady();
    loadData();
  }




}