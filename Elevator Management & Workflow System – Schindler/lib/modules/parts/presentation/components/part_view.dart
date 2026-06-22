import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/utils/url.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/parts/data/models/part_model.dart';

class PartView extends StatelessWidget {
  final PartModel model;
  const PartView(this.model,{super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2.5.vmin),
      child: Padding(
        padding: EdgeInsets.all(1.25.vmin),
        child: Column(
          children: [
            ListTile(
              title: Text(model.name),
              subtitle: Text(DateFormat("yyyy-MM-dd").format(model.createdAt)),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  // TODO
                },
              ),
            ),
            ListTile(
              title: const Text("Price"),
              subtitle: Text('${model.price}'),
            ),
            ListTile(
              title: const Text("Wholesale Price"),
              subtitle: Text("${model.wholesalePrice}"),
            ),
            ListTile(
              title: const Text("Count :"),
              subtitle: Text("${model.count}"),
            ),
            ListTile(
              title: const Text("Nationality :"),
              subtitle: Text(model.isNationality ? 'Yes':'No'),
            ),
          ],
        ),
      ),
    );
  }
}
