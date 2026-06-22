import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core_components/no_permission_screen.dart';

class CustomMiddleware extends GetMiddleware {

  final bool access;
  CustomMiddleware(this.access);

  @override
  RouteSettings? redirect(String? route) {
    return access ? null : const RouteSettings(
      name: NoPermissionScreen.name
    );
  }
}