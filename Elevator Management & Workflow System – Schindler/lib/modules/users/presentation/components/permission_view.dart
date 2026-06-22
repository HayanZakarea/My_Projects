import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';


class PermissionView extends StatefulWidget {

  final PermissionModel model;

  const PermissionView({super.key, required this.model});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {


  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: _trailing,
        title: Text(widget.model.name),
        onTap: _select,
      ),
    );
  }

  PermissionsController? get controller {
    try{
      return Get.find<PermissionsController>();
    }catch(_){
      return null;
    }
  }

  void _select(){
    setState(() {
      controller?.select?.call(widget.model);
      _selected = !_selected;
    });
  }

  Widget? get _trailing {
    print(controller?.select);
    if(controller?.select == null)
      return null;
    return Icon(_selected ? Icons.check_box_outlined:Icons.check_box_outline_blank);
  }
}
