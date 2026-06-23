
import 'package:dio/dio.dart';

import '../storage/storage_handler.dart';

class NetworkHandler {
  static NetworkHandler? _instance;
  NetworkHandler._();
  factory NetworkHandler() => _instance ??= NetworkHandler._();

  Dio get _dio => Dio(
    BaseOptions(
      headers: {
        //'Accept':"application/json",
        if(StorageHandler().hasToken)
          'Authorization':'Bearer ${StorageHandler().token}'
      }
    )
  );

  Future<Response> get(String url){
    try{
      return _dio.get(url);
    }on DioException catch(e){
      throw Exception(e.response.toString());
    }
  }

  Future<Response> post(String url,{data}){
    return _dio.post(
        url,
        data: data
    );
  }

  Future<Response> patch(String url,{data}){
    return _dio.patch(
        url,
        data:data,
    );
  }

  Future<Response> delete(String url,{data}) =>
      _dio.delete(url,data: data);
}