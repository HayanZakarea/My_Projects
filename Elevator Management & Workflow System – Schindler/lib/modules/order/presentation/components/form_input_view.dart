import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/core/core_components/app_text_form_field.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/modules/order/data/models/value_send_model.dart';

import '../../../../core/utils/validator.dart';
import '../../../forms/data/models/from_model.dart';

class FormInputView extends StatelessWidget {
  const FormInputView(this.model,{super.key, required this.onValue, this.value});

  final FormModel model;
  final ValueChanged<ValueSendModel> onValue;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.question),
      subtitle: Text(value ?? ''),
      onTap: _setValue,
    );
  }

  void _setValue()async{
    final dataController = TextEditingController();
    switch(model.type){
      case 'number':
        showDialog(
            context: Get.context!,
            builder: (_)=> Dialog(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      hint: 'enter a number',
                      controller: dataController,
                      validator: Validator.requiredInt,
                    ),
                    Builder(
                      builder: (context) {
                        return SubmitButton(
                          onTap: (){
                            if(Form.of(context).validate()){
                              onValue(ValueSendModel(
                                  title: model.question,
                                  value: dataController.text
                              ));
                            }
                          },
                        );
                      }
                    )
                  ],
                ),
              ),
            )
        );
      case 'date':
        var date = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
        );
        if(date != null){
          onValue(
            ValueSendModel(
                title: model.question,
                value: date.toIso8601String()
            )
          );
        }
      case 'dropdown':
        showDialog(
            context: Get.context!,
            builder: (_)=> Dialog(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...model.answers.map(
                            (e) =>
                                ListTile(
                                  title: Text(e),
                                  onTap: () => onValue(
                                    ValueSendModel(title: model.question,
                                        value: e)
                                  ),
                                )
                    )
                  ],
                ),
              ),
            )
        );
      case 'radio':
        showDialog(
            context: Get.context!,
            builder: (_)=> Dialog(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...model.answers.map(
                            (e) =>
                            ListTile(
                              title: Text(e),
                              onTap: () => onValue(
                                  ValueSendModel(title: model.question,
                                      value: e)
                              ),
                            )
                    )
                  ],
                ),
              ),
            )
        );
      case 'long':
        showDialog(
            context: Get.context!,
            builder: (_)=> Dialog(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      hint: 'enter text',
                      controller: dataController,
                      validator: Validator.requiredText,
                      maxLines: 3,
                    ),
                    Builder(
                        builder: (context) {
                          return SubmitButton(
                            onTap: (){
                              if(Form.of(context).validate()){
                                onValue(ValueSendModel(
                                    title: model.question,
                                    value: dataController.text
                                ));
                              }
                            },
                          );
                        }
                    )
                  ],
                ),
              ),
            )
        );
      default :
        showDialog(
            context: Get.context!,
            builder: (_)=> Dialog(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      hint: 'enter text',
                      controller: dataController,
                      validator: Validator.requiredText,
                    ),
                    Builder(
                        builder: (context) {
                          return SubmitButton(
                            onTap: (){
                              if(Form.of(context).validate()){
                                onValue(ValueSendModel(
                                    title: model.question,
                                    value: dataController.text
                                ));
                              }
                            },
                          );
                        }
                    )
                  ],
                ),
              ),
            )
        );
    }
  }
}
