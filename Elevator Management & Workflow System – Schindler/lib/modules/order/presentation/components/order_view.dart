import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/order_info_screen.dart';
import '../../data/models/order_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderView extends StatelessWidget {
  final OrderModel model;
  const OrderView(this.model,{super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2.5.vmin),
      child: Padding(
        padding:  EdgeInsets.all(1.5.vmin),
        child: Column(
          children: [
            ListTile(
              title: Text(model.title),
              subtitle: Text(model.description),
              trailing: IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: ()=> OrderInfoScreen.navigate(model),
              ),
            ),
            ListTile(
              title: Text("Service Type : ${model.typeOfService}"),
              subtitle: Text("Units : ${model.numberOfUnits} , Elevators : ${model.numberOfElevators}"),
            ),
            ListTile(
              title: Text("Price : ${model.price}"),
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
    );
  }
}
