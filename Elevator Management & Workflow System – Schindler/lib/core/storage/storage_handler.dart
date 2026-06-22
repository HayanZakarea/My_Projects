
import 'package:get_storage/get_storage.dart';

class StorageHandler {

  static StorageHandler? _instance;
  StorageHandler._();
  factory StorageHandler() => _instance ??= StorageHandler._();

  static Future<void> init()=>
      GetStorage.init();

  final _storage = GetStorage();

  Future<void> setToken(String token) => _storage.write('token', token);
  Future<void> removeToken() => _storage.remove('token');
  String get token => _storage.read('token');
  bool get hasToken => _storage.hasData('token');


  Future<void> setPermissions(List<String> permissions) => _storage.write('permissions', permissions);
  Future<void> removePermissions() => _storage.remove('permissions');
  List<String> get permissions => hasPermissions ?
  (_storage.read('permissions') as List).map((e) => e.toString()).toList():[];
  bool get hasPermissions => _storage.hasData('permissions');


  Future<void> setSuper(bool s) => _storage.write('super', s);
  Future<void> removeSuper() => _storage.remove('super');
  bool get isSuper =>hasSuper ? _storage.read('super'):true;
  bool get hasSuper => _storage.hasData('super');


}