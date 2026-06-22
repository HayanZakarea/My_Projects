import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/order/presentation/components/order_view.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
import '../components/contract_view.dart';
import 'create_contract_screen.dart';

class ContractsScreen extends GetView<ContractsController> {
  const ContractsScreen({super.key});

  static const name = '/contracts';
  static final page = GetPage(
      name: name,
      page: () => const ContractsScreen(),
      binding: ContractsBinding(),
      middlewares:[
        UserPermissions().getMiddleware('contract.index')
      ]
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CONTRACTS"),
      ),

      body: GetBuilder<ContractsController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> ContractView(data[i]),
              ),
            );
          }
      ),
      floatingActionButton: Visibility(
        visible: UserPermissions().has('contract.create'),
        child: ElevatedButton.icon(
          onPressed: ()=>Get.toNamed(CreateContractScreen.name),
          icon: const Icon(Icons.document_scanner_outlined),
          label: const Text('create'),
        ),
      ),
    );
  }
}
