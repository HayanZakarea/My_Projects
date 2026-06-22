import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/order/presentation/components/order_view.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_controller.dart';

import '../../../../core/permissions/user_permissions.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  static const name = '/orders';
  static final page = GetPage(
      name: name,
      page: () => const OrdersScreen(),
      binding: OrdersBinding(),
      middlewares:[
        UserPermissions().getMiddleware('order.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ORDERS"),
      ),

      body: GetBuilder<OrdersController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> OrderView(data[i]),
              ),
            );
          }
      ),
    );
  }
}
