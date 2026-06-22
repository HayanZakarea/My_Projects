import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';

import '../../../../core/core_components/app_text_form_field.dart';
import '../controller/team_info/team_info_controller.dart';

class VisitView extends GetView<TeamInfoController> {
  final VisitModel model;

  const VisitView(this.model,{super.key,});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2.vmin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.vmin),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(3.vmin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Visit #${model.id}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.vmin),

            _buildInfoRow("Elevator ID", model.elevatorId.toString()),
            _buildInfoRow("Team ID", model.teamId.toString()),
            _buildInfoRow("Date", model.date.toString().split(' ').first),
            _buildInfoRow("Type", model.type),
            _buildInfoRow("Report", model.report ?? "NO REPORT"),
            _buildInfoRow("Confirm", model.confirm ? "Yes" : "No"),

            SizedBox(height: 3.vmin),
            Text(
              "Schedules:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.5.vmin),

            ...model.visitSchedules.map((s) => _buildScheduleCard(s)).toList(),
            Visibility(
              visible: !model.confirm,
              child: ElevatedButton(
                onPressed: ()=>showDialog(
                    context: context,
                    builder: (_){
                      final reportController = TextEditingController();

                      return Dialog(
                        child: Padding(
                          padding: EdgeInsets.all(2.5.vmin),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppTextFormField(
                                controller: reportController,
                                hint: "report",
                              ),
                              SizedBox(
                                height: 5.vmin,
                              ),
                              ElevatedButton(
                                  onPressed: (){
                                    controller.confirm(model,reportController.text);
                                    Navigator.pop(_);
                                  },
                                  child: Text("Confirm")
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                child: Text("Confirm"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.vmin),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(VisitScheduleModel schedule) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.vmin),
      padding: EdgeInsets.all(2.vmin),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(2.vmin),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("From", schedule.from.toString()),
          _buildInfoRow("To", schedule.to.toString()),
          _buildInfoRow("Note", schedule.note),
        ],
      ),
    );
  }
}
