
import 'dart:typed_data';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';

import '../models/part_model.dart';
class PartsDataSource {

  static Future<List<PartModel>> getParts()async{
    var response = await NetworkHandler().get(ApiConst.part);
    List data = response.data['data']['part'];
    return data.map(
            (e) => PartModel.fromJson(e)
    ).toList();
  }

  static Future<void> createPart({
    required String name,
    required int price,
    required int wholesalePrice,
    required int count,
    required bool isNationality,

}) =>
      NetworkHandler().post(
          ApiConst.part,
          data: {
            'name': name,
            'price': price,
            'wholesale_price': wholesalePrice,
            'count': count,
            'is_nationality': isNationality ? 1 : 0
          }.map((key, value) => MapEntry(key, value.toString())),
      );


}