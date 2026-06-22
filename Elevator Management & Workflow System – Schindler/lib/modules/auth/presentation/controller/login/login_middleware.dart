
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/storage/storage_handler.dart';
import 'package:elevator_management_app/modules/home/presentation/screens/home_screen.dart';
// import 'package:elevator_management_app/modules/groups/presentation/screens/groups_screen.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if(StorageHandler().hasToken){
      return const RouteSettings(
        name: HomeScreen.name
      );
    }
    return null;
  }
}