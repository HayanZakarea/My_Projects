  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:responsive_sizer/responsive_sizer.dart';
  import 'package:elevator_management_app/core/core_components/state_component.dart';
  import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';
  import 'package:elevator_management_app/core/utils/responsive_utils.dart';
  import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
  import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
import 'package:elevator_management_app/modules/order/data/models/order_model.dart';
  import 'package:elevator_management_app/modules/users/data/models/permission_model.dart';
import 'package:elevator_management_app/modules/users/presentation/components/client_view.dart';
  import 'package:elevator_management_app/modules/users/presentation/components/permission_view.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/clents/client_binding.dart';
import 'package:elevator_management_app/modules/users/presentation/controller/clents/client_controller.dart';
  import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_binding.dart';
  import 'package:elevator_management_app/modules/users/presentation/controller/permissions/permissions_controller.dart';

  class ClientsScreen extends GetView<ClientController> {
    const ClientsScreen({super.key});

    static const name = '/clients';
    static final page = GetPage(
      name: name,
      page: () => const ClientsScreen(),
      binding: CLientBinding(),
      middlewares: [
        UserPermissions().getMiddleware('client.index')
      ]
    );

    static void navigateWithSelector(ValueChanged<ClientModel> select){
      Get.toNamed(name,arguments: select);
    }

    @override
    Widget build(BuildContext context) {
      MediaQuery.of(context);
      return Scaffold(
        appBar: AppBar(
          title: Text("Clients"),
        ),

        body: GetBuilder<ClientController>(
          builder: (_) {
            return StateComponent(
              state: controller.state,
              onSuccess: (_,data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (_,i)=> ClientView(model: data[i]),
              ),
            );
          }
        ),
      );
    }
  }
