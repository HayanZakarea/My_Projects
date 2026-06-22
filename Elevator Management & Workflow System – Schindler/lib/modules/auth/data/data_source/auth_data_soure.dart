
import 'dart:developer';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/core/storage/storage_handler.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';

class AuthDataSource {


  // static Future<void> register({
  //   required String name,
  //   required String email,
  //   required String password,
  // })async{
  //   var response = await NetworkHandler().post(
  //       ApiConst.register,
  //       data: {
  //         "email":email,
  //         "name":name,
  //         "password":password,
  //         "password_confirmation":password
  //       }
  //   );
  //   log(response.data.toString());
  //   await StorageHandler().setToken(response.data['data']['AccessToken']);
  // }

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

    await StorageHandler().setToken(response.data['data']['token']);
    var roles = (response.data['data']['user']['roles'] as List).map(
            (e) => RoleModel.fromJson(e)
    );
    Set<String> permissions = {};
    for(var role in roles){
      permissions.addAll(role.permissions.map((e) => e.name));
    }
    await StorageHandler().setPermissions(permissions.toList());
    await StorageHandler().setSuper(roles.where((e) => e.name == 'Super-Admin').isNotEmpty);
  }


}