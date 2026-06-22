import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_info/order_info_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/order_info/order_info_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/check_step_screen.dart';

import '../../../../core/permissions/user_permissions.dart';

class OrderInfoScreen extends GetView<OrderInfoController> {
  const OrderInfoScreen({super.key});

  static const _name = '/order_info';
  static final page = GetPage(
      name: _name,
      page: () => const OrderInfoScreen(),
      binding: OrderInfoBinding(),
      middlewares: [UserPermissions().getMiddleware('order.index')]);

  static void navigate(OrderModel model) =>
      Get.toNamed(_name, arguments: model);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER : ${controller.model.title}"),
      ),
      body: GetBuilder<OrderInfoController>(builder: (_) {
        return StateComponent(
          state: controller.state,
          onSuccess: (_, data) => CustomScrollView(
            slivers: [
              SliverList.list(children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(data.title),
                        subtitle: Text(data.description),
                      ),
                    ),
                    Visibility(
                      visible: UserPermissions().has('order.update'),
                      child: ElevatedButton(
                              onPressed: () => CheckStepScreen.navigate(data),
                              child: const Text("Check steps"))
                          .paddingSymmetric(horizontal: 2.5.vmin),
                    )
                  ],
                ),
                ListTile(
                  title: Text("Service Type : ${data.typeOfService}"),
                  subtitle: Text(
                      "Units : ${data.numberOfUnits} , Elevators : ${data.numberOfElevators}"),
                ),
                ListTile(
                  title: Text("Price : ${data.price}"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.vmin),
                    child: Text(
                        DateFormat("yyyy-MM-dd hh:mm").format(data.createdAt)),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Elevators"),
                  textColor: context.theme.colorScheme.secondary,
                ),
              ]),
              SliverList.builder(
                  itemCount: data.elevators?.length ?? 0,
                  itemBuilder: (_, i) {
                    var elevator = data.elevators![i];
                    return Card(
                      child: ListTile(
                        title: Text(elevator.name),
                        subtitle: Text(
                          "${DateFormat("yyyy-MM-dd").format(elevator.start)} "
                          "to ${DateFormat("yyyy-MM-dd").format(elevator.end)}",
                        ),
                      ),
                    );
                  }),
              if (data.contract != null) ...[
                SliverList.list(children: [
                  const Divider(),
                  ListTile(
                    title: const Text("Contract"),
                    textColor: context.theme.colorScheme.secondary,
                  ),
                ]),
                SliverList.list(children: [
                  ListTile(
                    title: Text(data.contract!.title ?? 'no title'),
                    subtitle: Text(data.contract!.description ?? 'no description'),
                  ),
                  ListTile(
                    title: Text("Price : ${data.contract!.price ?? 'no price'}"),
                  ),
                  ListTile(
                    title: Text("Payments : ${data.contract!.numOfPayments ?? 'unset'}"),
                  ),
                  ListTile(
                    title: Text("Elevators : ${data.contract!.numOfElevators ?? 'unset'}"),
                  ),
                  ListTile(
                    title: Text("From : ${data.contract!.from ?? ''} To : ${data.contract!.from ?? ''}"),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.vmin),
                      child: Text(DateFormat("yyyy-MM-dd").format(data.contract!.createdAt)),
                    ),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Units"),
                  ),
                ]),
              ],

              SliverList.list(children: [
                const Divider(),
                ListTile(
                  title: const Text("Info"),
                  textColor: context.theme.colorScheme.secondary,
                ),
              ]),

              SliverList.builder(
                itemCount: data.values?.length ?? 0,
                itemBuilder: (_,i) => ListTile(
                  title: Text(data.values![i].title),
                  subtitle: Text(data.values![i].value),
                ),
              ),


              SliverList.list(children: [
                const Divider(),
                ListTile(
                  title: const Text("Reports"),
                  textColor: context.theme.colorScheme.secondary,
                ),
              ]),

              SliverList.builder(
                itemCount: data.steps?.length ?? 0,
                itemBuilder: (_, i) {
                  var step = data.steps![i];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.vmin, vertical: 1.vmin),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.article_outlined,
                                color: Colors.blueAccent, size: 28),
                            const SizedBox(height: 8),
                            Text(
                              step.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              step.report,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),




            ],
          ),
          onLoading: (_) => ListView(
            children: [
              ListTile(
                title: Text(controller.model.title),
                subtitle: Text(controller.model.description),
              ),
              ListTile(
                title: Text("Service Type : ${controller.model.typeOfService}"),
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
              const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      }),
    );
  }
}
