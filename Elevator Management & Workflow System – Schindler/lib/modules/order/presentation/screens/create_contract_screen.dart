import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';
import 'package:elevator_management_app/core/utils/dates_format.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_binding.dart';
import 'package:elevator_management_app/modules/catalog/presentation/controller/create_catalog/create_catalog_controller.dart';
import 'package:elevator_management_app/modules/forms/presentation/controller/forms/forms_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/components/form_input_view.dart';
import 'package:elevator_management_app/modules/order/presentation/components/order_view.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/contracts/contracts_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/create_contract/create_contract_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/create_contract/create_contract_controller.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/orders/orders_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/clients_screen.dart';

import '../../../../core/core_components/app_text_form_field.dart';
import '../../../../core/core_components/submit_button.dart';
import '../components/contract_view.dart';

class CreateContractScreen extends GetView<CreateContractController> {
  const CreateContractScreen({super.key});

  static const name = '/create_contract';
  static final page = GetPage(
      name: name,
      page: () => const CreateContractScreen(),
      binding: CreateContractBinding(),
      middlewares: [
        UserPermissions().getMiddleware('contract.create')
      ]
  );


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE CONTRACT"),
      ),
      body: GetBuilder<CreateContractController>(
        builder: (_) {
          return CustomScrollView(
            slivers: [
              SliverList.list(children: [
                SizedBox(
                  height: 2.5.vmin,
                ),
                ListTile(
                  title: const Text('Selected client'),
                  subtitle: Text("Selected : ${controller.selectedClient?.name ?? ''}"),
                  onTap: (){
                    ClientsScreen.navigateWithSelector(controller.select);
                  },
                ),
                SizedBox(
                  height: 2.5.vmin,
                ),
                const Divider(),
                AppTextFormField(
                  hint: 'title',
                  controller: controller.titleController,
                ),
                AppTextFormField(
                  hint: 'description',
                  controller: controller.descriptionController,
                ),
                AppTextFormField(
                  hint: 'price',
                  controller: controller.priceController,
                ),
                AppTextFormField(
                  hint: 'number of elevators',
                  controller: controller.numOfElevatorsController,
                ),
                AppTextFormField(
                  hint: 'number of payments',
                  controller: controller.numOfPaymentsController,
                ),
                Obx(
                      () => Card(
                    child: ListTile(
                        title: Text(
                            controller.from.value.dateFormatedBy("yyyy-MM-dd") ??
                                'unset'),
                        subtitle: const Text('from date'),
                        onTap:_setFromTo
                    ),
                  ),
                ),
                Obx(
                      () => Card(
                    child: ListTile(
                        title: Text(
                            controller.to.value?.dateFormatedBy("yyyy-MM-dd") ??
                                'unset'),
                        subtitle: const Text('to date'),
                        onTap: _setFromTo
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Units"),
                ),
              ]),
              GetBuilder<CreateContractController>(builder: (_) {
                return StateComponent.sliver(
                  state: controller.unitsState,
                  onSuccess: (_, data) => SliverList.separated(
                    itemCount: data.length,
                    itemBuilder: (_, i) => Card(
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            if (!controller.selectedUnits.add(data[i])) {
                              controller.selectedUnits.remove(data[i]);
                            }
                          },
                          icon: Icon(controller.selectedUnits.contains(data[i])
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                        ),
                        trailing: const Icon(Icons.info_outline),
                        title: Text(data[i].title),
                        subtitle: Text(data[i].address),
                      ),
                    ),
                    separatorBuilder: (_, __) => const Divider(),
                  ),
                );
              }),
              SliverList.list(children: const [
                Divider(),
                ListTile(
                  title: Text("Other"),
                ),
              ]),
              GetBuilder<FormsController>(
                  builder: (formsController) =>
                      StateComponent.sliver(
                          state: formsController.state,
                          onSuccess: (_,data) => SliverList.builder(
                            itemCount: data.length,
                            itemBuilder: (_,i) => FormInputView(data[i],
                                onValue: (model) => controller.selectValue(model, data[i].id),
                                value: controller.values[data[i].id]?.value ?? '',
                            )
                          )
                      )
              ),
              SliverList.list(children: [
                SubmitButton(
                  onTap: controller.sendData,
                ).paddingSymmetric(
                    horizontal: 25.vmin
                )
              ])
            ],
          ).paddingAll(2.5.vmin);
        }
      ),
    );
  }

  void _setFromTo() async {
    var result = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    controller.to(result?.end);
    controller.from(result?.start);
  }
}
