import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/modules/order/data/models/order_type_model.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/check_step/check_step_binding.dart';
import 'package:elevator_management_app/modules/order/presentation/controller/check_step/check_step_controller.dart';

import '../../../../core/core_components/state_component.dart';
import '../../../../core/permissions/user_permissions.dart';
import '../../data/models/order_model.dart';
import '../controller/apply_step/apply_step_binding.dart';
import '../controller/apply_step/apply_step_controller.dart';

class ApplyStepScreen extends GetView<ApplyStepController> {
  const ApplyStepScreen({super.key});

  static const _name = '/apply-step';
  static final page = GetPage(
      name: _name,
      page: () => const ApplyStepScreen(),
      binding: ApplyStepBinding(),
      middlewares: [UserPermissions().getMiddleware('order.update')]);

  static void navigate(StepModel model,int orderId) =>
      Get.toNamed(_name, arguments: {
        'model':model,
        'order_id':orderId
      });

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    final model = controller.model;
    return Scaffold(
      appBar: AppBar(
        title: Text("STEP : ${model.name} , ${model.arrangement}"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              Visibility(
                  visible: model.hasReport,
                  child: AppTextFormField(
                    hint: 'Report',
                    maxLines: 3,
                    controller: controller.reportController,
                  )
              ),
              const Divider(),
              const Text("Questions : "),
            ],
          ),
          SliverList.builder(
            itemCount: model.values.length,
            itemBuilder: (_,i) => Card(
              child:Obx(()=> ListTile(
                title: Text(model.values[i].question),
                onTap: () => _addAnswer(context, model.values[i].id),
                subtitle: Text(controller.answers[model.values[i].id] ?? ''),
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: SubmitButton(
              onTap: controller.sendData,
            ).paddingSymmetric(horizontal: 25.vmin,vertical: 5.vmin),
          )
        ],
      ).paddingAll(2.5.vmin)
    );
  }

  void _addAnswer(BuildContext context,int id) {
    showDialog(
        context: context,
        builder: (_) =>
            Dialog(
              child: Padding(
                padding: EdgeInsets.all(2.5.vmin),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      controller: controller.answerController,
                      hint: 'answer',
                    ),
                    SubmitButton(
                      onTap: () {
                        controller.addAnswer(id);
                        Navigator.pop(_);
                      },
                    )
                  ],
                ),
              ),
            )
    );
  }
}
