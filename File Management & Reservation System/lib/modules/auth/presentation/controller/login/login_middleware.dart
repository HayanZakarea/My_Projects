
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/core/storage/storage_handler.dart';
import 'package:web_app/modules/groups/presentation/screens/groups_screen.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if(StorageHandler().hasToken){
      return const RouteSettings(
        name: GroupsScreen.name
      );
    }
    return null;
  }
}