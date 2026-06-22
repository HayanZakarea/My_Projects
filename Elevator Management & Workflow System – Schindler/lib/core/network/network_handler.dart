
import 'dart:typed_data';

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

  Future<Response> post(String url,{Map<String,dynamic>? data,Map<String,Uint8List>? files}){
    dynamic body = data;
    if(files != null){
      data?.addAll(files.map((key, value) => MapEntry(key,
        MultipartFile.fromBytes(value)
      )));
      body = FormData.fromMap(data??{});
    }
    return _dio.post(
        url,
        data: body,
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