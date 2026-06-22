
import 'dart:typed_data';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/modules/forms/data/models/from_model.dart';

class FormsDataSource {

  static Future<List<FormModel>> getForms()async{
    var response = await NetworkHandler().get(ApiConst.form);
    List data = response.data['data']['form'];
    return data.map(
            (e) => FormModel.fromJson(e)
    ).toList();
  }

  static Future<void> createForm({
    required String question,
    required String type,
    required List<String> answers
}) =>
      NetworkHandler().post(
          ApiConst.form,
          data: {
            'question': question,
            'type': type,
            'answers': answers,
          }
      );


}