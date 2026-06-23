
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

}