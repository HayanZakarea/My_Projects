import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contract_info/contract_info_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contract_info/contract_info_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_info/order_info_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_info/order_info_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/update_contract_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class ContractInfoScreen extends GetView<ContractInfoController> {
  const ContractInfoScreen({super.key});

  static const _name = '/contract_info';
  static final page = GetPage(
      name: _name,
      page: () => const ContractInfoScreen(),
      binding: ContractInfoBinding(),
      middlewares:[
        UserPermissions().getMiddleware('contract.index')
      ]
  );

  static void navigate(ContractModel model) =>
      Get.toNamed(_name,arguments: model);



  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTRACT : ${controller.model.title ?? 'no title'}"),
        actions: [
          GetBuilder<ContractInfoController>(
            builder: (_) {
              return Visibility(
                visible: controller.state.isSuccess && UserPermissions().has('contract.update'),
                child: IconButton(
                    onPressed: () => UpdateContractScreen.navigate(controller.state.data!),
                    icon:const Icon(Icons.edit)
                ),
              );
            }
          )
        ],
      ),

      body: GetBuilder<ContractInfoController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => CustomScrollView(
                slivers: [
                  SliverList.list(children: [
                    GetBuilder<ContractInfoController>(
                      builder: (_) {
                        return StateComponent(
                            state: controller.state,
                            onSuccess: (_,data) => ListTile(
                              title: Text(data.client?.name ?? 'no client'),
                            ),
                        );
                      }
                    ),
                    ListTile(
                      title: Text(controller.model.title ?? 'no title'),
                      subtitle: Text(controller.model.description ?? 'no description'),
                    ),
                    ListTile(
                      title: Text("Price : ${controller.model.price ?? 'no price'}"),
                    ),
                    ListTile(
                      title: Text("Payments : ${controller.model.numOfPayments ?? 'unset'}"),
                    ),
                    ListTile(
                      title: Text("Elevators : ${controller.model.numOfElevators ?? 'unset'}"),
                    ),
                    ListTile(
                      title: Text("From : ${controller.model.from ?? ''} To : ${controller.model.from ?? ''}"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.vmin),
                        child: Text(DateFormat("yyyy-MM-dd hh:mm").format(controller.model.createdAt)),
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text("Units"),
                    ),
                  ]),
                  SliverList.builder(
                      itemCount: data.units.length,
                      itemBuilder: (_,i){
                        var unit = data.units[i];
                        return Card(
                          child: ListTile(
                            title: Text(unit.title),
                            subtitle: Text(unit.address),
                          ),
                        );
                      }
                  ),
                  SliverList.list(children: const [
                    Divider(),
                    ListTile(
                      title: Text("Other"),
                    ),
                  ]),

                  SliverList.builder(
                      itemCount: data.values.length,
                      itemBuilder: (_,i){
                        var value = data.values[i];
                        return Card(
                          child: ListTile(
                            title: Text(value.title),
                            subtitle: Text(value.value),
                          ),
                        );
                      }
                  ),
                ],
              ),

            );
          }
      ),
    );
  }
}
