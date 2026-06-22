import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/state_component.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/create_visit/create_visit_binding.dart';
import 'package:elevator_management_app/modules/teams/presentation/controller/create_visit/create_visit_controller.dart';

import '../../../../core/permissions/user_permissions.dart';
import '../../data/models/schedule_model.dart';

class CreateVisitScreen extends GetView<CreateVisitController> {
  static const _name = '/create_visit';
  static final page = GetPage(
      name: _name,
      page: () => const CreateVisitScreen(),
      binding: CreateVisitBinding(),
      middlewares: [UserPermissions().getMiddleware('visit.create')]);

  const CreateVisitScreen({super.key});

  static void navigate(TeamModel model) => Get.toNamed(_name, arguments: model);

  static const List<String> types = ['maintenance', 'composition', 'repair'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE VISIT"),
      ),
      body: GetBuilder<CreateVisitController>(
        builder: (_) => StateComponent(
          state: controller.elevatorsState,
          onSuccess: (_, data) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- TYPE SELECTOR ---
                      Obx(() => DropdownButtonFormField<String>(
                        value: controller.type.value,
                        items: CreateVisitScreen.types
                            .map((t) => DropdownMenuItem(
                          value: t,
                          child: Text(t.toUpperCase()),
                        ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) controller.type.value = val;
                        },
                        decoration: const InputDecoration(
                          labelText: "Visit Type",
                          border: OutlineInputBorder(),
                        ),
                      )),
                      const SizedBox(height: 16),

                      // --- MAIN VISIT DATE ---
                      Obx(() => ListTile(
                        title: Text(controller.date.value == null
                            ? "Select Visit Date"
                            : controller.date.value!
                            .toString()
                            .split(" ")
                            .first),
                        trailing: const Icon(Icons.calendar_today),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) controller.date.value = picked;
                        },
                      )),
                      const SizedBox(height: 16),

                      // --- ADD SCHEDULE (FROM DATE → TO DATE) ---
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? from = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (from == null) return;

                          DateTime? to = await showDatePicker(
                            context: context,
                            initialDate: from.add(const Duration(days: 1)),
                            firstDate: from,
                            lastDate: DateTime(2100),
                          );
                          if (to == null) return;

                          final noteController = TextEditingController();

                          // Dialog to enter note
                          Get.dialog(AlertDialog(
                            title: const Text("Add Note"),
                            content: TextField(
                              controller: noteController,
                              decoration: const InputDecoration(
                                hintText: "Enter note",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  controller.schedules.add(ScheduleModel(
                                    from: from,
                                    to: to,
                                    note: noteController.text,
                                  ));
                                  Get.back();
                                },
                                child: const Text("Add"),
                              )
                            ],
                          ));
                        },
                        child: const Text("Add Schedule"),
                      ),

                      const SizedBox(height: 16),

                      // --- SCHEDULE LIST ---
                      Obx(() => Column(
                        children: controller.schedules
                            .map((s) => ListTile(
                          leading: const Icon(Icons.date_range),
                          title: Text(
                              "${s.from.toString().split(" ").first} → ${s.to.toString().split(" ").first}"),
                          subtitle: Text(s.note),
                        ))
                            .toList(),
                      )),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => RadioListTile<ElevatorModel>(
                  value: data[i],
                  groupValue: controller.selectedElevator,
                  onChanged: controller.selectElevator,
                  title: Text(data[i].name),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.sendData,
        child: const Icon(Icons.check),
      ),
    );
  }
}
