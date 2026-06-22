
import 'package:elevator_management_app/core/storage/storage_handler.dart';

import 'custom_middleware.dart';

class UserPermissions {

  UserPermissions._();
  static UserPermissions? _instance;
  factory UserPermissions() => _instance ??= UserPermissions._();

  final Set<String> _permissions = StorageHandler().permissions.toSet();

  bool get isSuper => StorageHandler().isSuper;

  CustomMiddleware getMiddleware(String permission)=>
      CustomMiddleware(isSuper || _permissions.contains(permission));

  bool has(String permission) => _permissions.contains(permission) || isSuper;

  T? protect<T>(String permission,T? value,{
    T? replacement
  }) => has(permission) ? value : replacement;

}