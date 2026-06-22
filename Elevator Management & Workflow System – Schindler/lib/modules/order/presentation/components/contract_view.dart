import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';

import '../screens/contract_info_screen.dart';

class ContractView extends StatelessWidget {
  final ContractModel model;
  const ContractView(this.model,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      data: context.theme.listTileTheme,
      child: Card(
        margin: EdgeInsets.all(2.5.vmin),
        child: Padding(
          padding: EdgeInsets.all(1.25.vmin),
          child: Column(
            children: [
              ListTile(
                title: Text(model.title ?? 'no title'),
                subtitle: Text(model.description ?? 'no description'),
                trailing: IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: ()=> ContractInfoScreen.navigate(model),
                ),
              ),
              Divider(
                color: context.theme.colorScheme.background,
              ),
              ListTile(
                title: Text("Elevators : ${model.numOfElevators ?? 'unset'} , Payments : ${model.numOfPayments ?? 'unset'}"),
              ),
              ListTile(
                title: Text("Price : ${model.price ?? 'unset'}"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.vmin),
                  child: Text(DateFormat("yyyy-MM-dd hh:mm").format(model.createdAt)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
