import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/utils/url.dart';
import 'package:elevator_management_app/modules/catalog/data/models/catalog_model.dart';
import 'package:elevator_management_app/modules/parts/data/models/part_model.dart';
import 'package:elevator_management_app/modules/teams/data/models/team_model.dart';
import 'package:elevator_management_app/modules/teams/presentation/screens/team_info_screen.dart';

class TeamView extends StatelessWidget {
  final TeamModel model;
  const TeamView(this.model,{super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TeamInfoScreen.navigate(model),
      child: Card(
        margin: EdgeInsets.all(2.5.vmin),
        child: Padding(
          padding: EdgeInsets.all(1.25.vmin),
          child: ListTile(
            title: Text(model.name),
            leading: const Icon(Icons.group),
          ),
        ),
      ),
    );
  }
}
