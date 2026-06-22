
import 'package:elevator_management_app/core/base_controller/load_data_controller.dart';
import 'package:elevator_management_app/modules/users/data/data_source/users_data_source.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/data/models/user_model.dart';

class UsersController extends LoadDataController<List<UserModel>>{
  @override
  Future<List<UserModel>> apiCall() =>
      UsersDataSource.getAllUsers();

}