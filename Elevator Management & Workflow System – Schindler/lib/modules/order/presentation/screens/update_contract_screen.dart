import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/core/utils/dates_format.dart';
import 'package:elevator_management_app/core/utils/validator.dart';
import 'package:elevator_management_app/modules/order/data/models/value_send_model.dart';
import '../../../../core/core_components/submit_button.dart';
import '../../../../core/permissions/user_permissions.dart';
import '../../data/models/order_model.dart';
import '../controller/update_contract/update_contract_binding.dart';
import '../controller/update_contract/update_contract_controller.dart';

class UpdateContractScreen extends GetView<UpdateContractController> {
  const UpdateContractScreen({super.key});

  static const _name = '/update_contract';
  static final page = GetPage(
      name: _name,
      page: () => const UpdateContractScreen(),
      binding: UpdateContractBinding(),
      middlewares:[
        UserPermissions().getMiddleware('contract.update')
      ]
  );

  static void navigate(ContractModel model) =>
      Get.toNamed(_name, arguments: model);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UPDATE CONTRACT"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            ListTile(
              title: Text(controller.model.client?.name ?? 'no client'),
            ),
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
                      controller.from.value?.dateFormatedBy("yyyy-MM-dd") ??
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
          GetBuilder<UpdateContractController>(builder: (_) {
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
          SliverList.builder(
              itemCount: controller.model.values.length,
              itemBuilder: (_, i) {
                var value = controller.model.values[i];
                return Card(
                  child: ListTile(
                    title: Text(value.title),
                    subtitle: Text(value.value),
                  ),
                );
              }),
          SliverList.list(children: [
            const Divider(),
            ListTile(
              title: const Text("Add other"),
              trailing:
                  IconButton(onPressed: _addValue, icon: const Icon(Icons.add)),
            ),
          ]),
          Obx(() => SliverList.builder(
              itemCount: controller.addedValues.length,
              itemBuilder: (_, i) {
                var value = controller.addedValues[i];
                return Card(
                  child: ListTile(
                    title: Text(value.title),
                    subtitle: Text(value.value),
                    trailing: IconButton(
                      onPressed: () => controller.addedValues.remove(value),
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              })),
          SliverToBoxAdapter(
            child: SubmitButton(
              onTap: controller.sendData,
            ).paddingSymmetric(horizontal: 25.vmin),
          )
        ],
      ).paddingAll(2.5.vmin),
    );
  }

  // Future<DateTime?> _selectDate() => showDatePicker(
  //     context: Get.context!,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now().subtract(const Duration(days: 365)),
  //     lastDate: DateTime.now().add(const Duration(days: 365)),
  // );

  void _setFromTo() async {
    var result = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    controller.to(result?.end);
    controller.from(result?.start);
  }

  void _addValue() async {
    final titleController = TextEditingController();
    final valueController = TextEditingController();

    await showDialog(
        context: Get.context!,
        builder: (_) => Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 25.vmin),
              child: Form(
                child: Padding(
                  padding: EdgeInsets.all(5.vmin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFormField(
                        hint: 'title',
                        controller: titleController,
                        validator: Validator.requiredText,
                      ),
                      AppTextFormField(
                        hint: 'value',
                        controller: valueController,
                        validator: Validator.requiredText,
                      ).paddingSymmetric(vertical: 2.5.vmin),
                      Builder(builder: (context) =>SubmitButton(
                            onTap: () {
                              if (Form.of(context).validate()) {
                                controller.addedValues.add(ValueSendModel(
                                    title: titleController.text,
                                    value: valueController.text));
                                Navigator.pop(_);
                              }
                            },
                            label:'add',
                        )
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
