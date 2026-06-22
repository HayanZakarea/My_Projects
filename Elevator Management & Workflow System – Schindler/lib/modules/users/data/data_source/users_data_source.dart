
import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';

class UsersDataSource {


  static Future<List<PermissionModel>> getAllPermission() async {
    var response = await NetworkHandler().get(ApiConst.permissions);
    List data = response.data['data']['permission'];
    return data.map((e) => PermissionModel.fromJson(e)).toList();
  }

  static Future<List<RoleModel>> getAllRoles() async {
    var response = await NetworkHandler().get(ApiConst.roles);
    List data = response.data['data']['role'];
    return data.map((e) => RoleModel.fromJson(e)).toList();
  }

  static Future<List<UserModel>> getAllUsers() async {
    var response = await NetworkHandler().get(ApiConst.users);
    List data = response.data['data']['user'];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<List<ClientModel>> getAllClients() async {
    var response = await NetworkHandler().get(ApiConst.client);
    List data = response.data['data']['client'];
    return data.map((e) => ClientModel.fromJson(e)).toList();
  }



  static Future<void> createRole(String name,Set<PermissionModel> permissions)=>
      NetworkHandler().post(ApiConst.roles,data: {
        'permissions' : permissions.map((e) => e.name).toList(),
        'name':name
      });

  static Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required Set<RoleModel> roles,
})=>
      NetworkHandler().post(ApiConst.register,data: {
        'roles' : roles.map((e) => e.name).toList(),
        'name':name,
        'email':email,
        'password':password,
        'password_confirmation':password,
      });




}