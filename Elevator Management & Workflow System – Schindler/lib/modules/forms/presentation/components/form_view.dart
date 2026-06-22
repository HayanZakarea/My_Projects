import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/modules/forms/data/models/from_model.dart';

class FormView extends StatelessWidget {
  final FormModel model;
  const FormView(this.model,{super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2.5.vmin),
      child: ListTile(
        title: Text("${model.question} - ${model.type}"),
        subtitle: Text("answers :\n${model.answers.join("\n")}"),
      ).paddingAll(1.25.vmin),
    );
  }
}
