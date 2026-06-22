import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/clents/client_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';


class ClientView extends StatelessWidget {

  final ClientModel model;

  const ClientView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: _trailing,
        title: Text(model.name),
        subtitle: Text(model.mobile),
        onTap: () => controller?.select?.call(model),
      ),
    );
  }

  ClientController? get controller {
    try{
      return Get.find<ClientController>();
    }catch(_){
      return null;
    }
  }

  Widget? get _trailing {
    print(controller?.select);
    if(controller?.select == null)
      return null;
    return GetBuilder<ClientController>(
      builder: (_) {
        return Icon(controller?.selected == model ? Icons.radio_button_checked:Icons.radio_button_off);
      }
    );
  }
}
