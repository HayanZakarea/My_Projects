import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:elevator_management_app/modules/order/data/models/order_type_model.dart';

class OrderTypeView extends StatelessWidget {
  final OrderTypeModel model;
  const OrderTypeView(this.model,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(model.name),
        subtitle: Text(DateFormat().format(model.createdAt)),
      ),
    );
  }
}
