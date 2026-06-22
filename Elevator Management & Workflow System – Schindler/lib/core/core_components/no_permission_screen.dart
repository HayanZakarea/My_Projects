import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoPermissionScreen extends StatelessWidget {
  const NoPermissionScreen({super.key});

  static const name = '/no_permission';
  static final page = GetPage(
    name: name,
    page: () => const NoPermissionScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Access Denied"),
      ),
      body: const Center(
        child: Text('you don\'t have permission.'),
      ),
    );
  }
}
