import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/data/models/role_model.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/roles/roles_controller.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/role_info_screen.dart';


class RoleView extends StatefulWidget {

  final RoleModel model;

  const RoleView({super.key, required this.model});

  @override
  State<RoleView> createState() => _RoleViewState();
}

class _RoleViewState extends State<RoleView> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> RolesInfoScreen.navigate(widget.model),
      child: Card(
        child: ListTile(
          trailing: _trailing,
          onTap: controller?.select != null ? _select : null,
          title: Text(widget.model.name),
          subtitle: Text(
              'permissions : ${widget.model.permissions.length}',
              style: context.theme.listTileTheme.subtitleTextStyle,
          ),
        ),
      ),
    );
  }

  RolesController? get controller {
    try{
      return Get.find<RolesController>();
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
    if(controller?.select == null) return null;
    return Icon(_selected ? Icons.check_box_outlined:Icons.check_box_outline_blank);
  }
}
