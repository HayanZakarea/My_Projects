import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';
import 'package:elevator_management_app/modules/order/presentation/components/order_type_view.dart';
import 'package:elevator_management_app/modules/order/presentation/components/order_view.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_types/order_types_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_types/order_types_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_controller.dart';

import 'create_order_type_screen.dart';

class OrderTypesScreen extends GetView<OrderTypesController> {
  const OrderTypesScreen({super.key});

  static const name = '/order-types';
  static final page = GetPage(
      name: name,
      page: () => const OrderTypesScreen(),
      binding: OrderTypesBinding(),
      middlewares:[
        UserPermissions().getMiddleware('order_type.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ORDER TYPES"),
      ),

      body: GetBuilder<OrderTypesController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> OrderTypeView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(CreateOrderTypeScreen.name),
        child: Icon(Icons.add),
      ),
    );
  }
}
