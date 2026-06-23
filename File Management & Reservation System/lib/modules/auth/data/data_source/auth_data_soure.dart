
import 'dart:developer';

import 'package:web_app/core/const/api_const.dart';
import 'package:web_app/core/network/network_handler.dart';
import 'package:web_app/core/storage/storage_handler.dart';

class AuthDataSource {


  static Future<void> register({
    required String name,
    required String email,
    required String password,
  })async{
    var response = await NetworkHandler().post(
        ApiConst.register,
        data: {
          "email":email,
          "name":name,
          "password":password,
          "password_confirmation":password
        }
    );
    log(response.data.toString());
    await StorageHandler().setToken(response.data['data']['AccessToken']);
  }

  static Future<void> login({
    required String email,
    required String password,
  })async{
    var response = await NetworkHandler().post(
        ApiConst.login,
        data: {
          "email":email,
          "password":password,
        }
    );
    log(response.data.toString());
    await StorageHandler().setToken(response.data['data']['AccessToken']);
  }


}