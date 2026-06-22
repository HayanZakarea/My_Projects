

import 'dart:async';

import 'package:dio/dio.dart';

import 'data_state.dart';

FutureOr<DataState<T>> handle<T>(FutureOr<T> Function() process) async{
  try{
    var data = await process();
    return DataState(
      data: data,
      status: DataStatus.success
    );
  }on DioException catch(e){
    print("ERROR : $e");
    print(e.response?.data);
    if(e.response?.statusCode == 403){
      return const DataState(
          message: "No Permission",
          status: DataStatus.fail
      );
    }
    if(e.response?.statusCode == 404){
      return const DataState(
          message: "Not Found",
          status: DataStatus.fail
      );
    }
    return DataState(
        message: e.toString(),
        status: DataStatus.fail
    );
  } catch(e){
    return DataState(
        message: e.toString(),
        status: DataStatus.fail
    );
  }
}