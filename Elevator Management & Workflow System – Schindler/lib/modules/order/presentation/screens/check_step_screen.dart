import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/check_step/check_step_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/check_step/check_step_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/apply_step_screen.dart';

import '../../../../core/core_components/state_component.dart';
import '../../../../core/permissions/user_permissions.dart';
import '../../data/models/order_model.dart';

class CheckStepScreen extends GetView<CheckStepController> {
  const CheckStepScreen({super.key});

  static const _name = '/check-step';
  static final page = GetPage(
      name: _name,
      page: () => const CheckStepScreen(),
      binding: CheckStepBinding(),
      middlewares: [UserPermissions().getMiddleware('order.update')]);

  static void navigate(OrderModel model) =>
      Get.toNamed(_name, arguments: model);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Step for : ${controller.model.title}"),
      ),
      body: GetBuilder<CheckStepController>(builder: (_) {
        return StateComponent(
          state: controller.state,
          onSuccess: (_, data) => CustomScrollView(
            slivers: [
              SliverList.list(children: [
                ListTile(
                  title: Text(controller.model.title),
                  subtitle: Text(controller.model.description),
                ),
                ListTile(
                  title:
                      Text("Service Type : ${controller.model.typeOfService}"),
                  subtitle: Text(
                      "Units : ${controller.model.numberOfUnits} , Elevators : ${controller.model.numberOfElevators}"),
                ),
                ListTile(
                  title: Text("Price : ${controller.model.price}"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.vmin),
                    child: Text(DateFormat("yyyy-MM-dd hh:mm")
                        .format(controller.model.createdAt)),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text("Elevators"),
                  textColor: context.theme.colorScheme.secondary,
                ),
              ]),
              SliverList.builder(
                  itemCount: controller.model.elevators?.length ?? 0,
                  itemBuilder: (_, i) {
                    var elevator = controller.model.elevators![i];
                    return Card(
                      child: ListTile(
                        title: Text(elevator.name),
                        subtitle: Text(
                            "${DateFormat("yyyy-MM-dd").format(elevator.start)} to ${DateFormat("yyyy-MM-dd").format(elevator.end)}"),
                      ),
                    );
                  }),
              SliverToBoxAdapter(
                child: ListTile(
                  title: Text(data.name),
                  subtitle: const Text('click to apply step'),
                  onTap: () => ApplyStepScreen.navigate(data,controller.model.id),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
