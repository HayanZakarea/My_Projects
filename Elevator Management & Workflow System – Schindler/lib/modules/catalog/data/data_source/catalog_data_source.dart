
import 'dart:typed_data';

import 'package:elevator_management_app/core/const/api_const.dart';
import 'package:elevator_management_app/core/network/network_handler.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';

class CatalogDataSource {

  static Future<List<CatalogModel>> getCatalogs()async{
    var response = await NetworkHandler().get(ApiConst.catalog);
    List data = response.data['data']['catalog'];
    return data.map(
            (e) => CatalogModel.fromJson(e)
    ).toList();
  }

  static Future<void> createCatalog({
    required String title,
    required String description,
    required int price,
    required List<String>? videos,
    required List<Uint8List> images,
}) =>
      NetworkHandler().post(
          ApiConst.catalog,
          data: {
            'title':title,
            'description':description,
            'price':price,
            for(int i = 0 ; i < (videos?.length ?? 0);i++)
              'videos[$i]':videos![i]

          },
        files:{
            for(int i = 0 ; i < images.length;i++)
              'image[$i]':images[i]
        }
      );



  static Future<void> updateCatalog({
    required int id,
    required String title,
    required String description,
    required int price,
    required List<String>? videos,
    required List<Uint8List> images,
  }) =>
      NetworkHandler().post(
          ApiConst.catalogById(id),
          data: {
            '_method':'PUT',
            'title':title,
            'description':description,
            'price':price,
            for(int i = 0 ; i < (videos?.length ?? 0);i++)
              'videos[$i]':videos![i]

          },
          files:{
            for(int i = 0 ; i < images.length;i++)
              'image[$i]':images[i]
          }
      );

}

