import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elevator_management_app/core/data_state/data_state.dart';
import 'package:elevator_management_app/core/data_state/exception_handler.dart';

abstract class SendDataController<T> extends GetxController {



  DataState<T> _state = const DataState(
      status: DataStatus.init
  );

  DataState<T> get state => _state;

  Future<T> apiCall();

      Future<void> sendData()async{
    if(!validate()){
      return ;
    }
    _state = const DataState(
        status: DataStatus.loading
    );
    update();
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        )
    );
    _state = await handle(apiCall);
    Get.back();
    if(_state.status.isFail)
      onFail();
    else
      onSuccess();
    update();
  }

  void onSuccess(){}
  void onFail(){
    Get.snackbar('Error', state.message);
  }


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState?.validate() ?? true;

}