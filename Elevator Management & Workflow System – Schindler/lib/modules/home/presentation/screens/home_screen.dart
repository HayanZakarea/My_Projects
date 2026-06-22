import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/core_components/app_logo.dart';
import 'package:elevator_management_app/core/core_components/submit_button.dart';
import 'package:elevator_management_app/core/storage/storage_handler.dart';
import 'package:elevator_management_app/core/utils/responsive_utils.dart';
import 'package:elevator_management_app/modules/auth/presentation/components/welcome_container.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/catalogs_screen.dart';
import 'package:elevator_management_app/modules/forms/presentation/screens/forms_screen.dart';
import 'package:elevator_management_app/modules/home/presentation/components/home_button.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/order_types_screen.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/orders_screen.dart';
import 'package:elevator_management_app/modules/teams/presentation/screens/teams_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/permissions_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/roles_screen.dart';

import '../../../order/presentation/screens/contracts_screen.dart';
import '../../../parts/presentation/screens/parts_screen.dart';
import '../../../users/presentation/screens/clients_screen.dart';
import '../../../users/presentation/screens/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = '/home';
  static final page = GetPage(
    name: name,
    page: () => const HomeScreen(),
  );

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD"),
        leading: IconButton(
            onPressed: () => StorageHandler().removeToken().then(
                    (value) => Get.offAllNamed('/')
            ),
            icon: const Icon(Icons.logout),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.25.vmin),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.gridFullCount,
            childAspectRatio: 2.25,
            crossAxisSpacing: 1.25.vmin,
            mainAxisSpacing: 1.25.vmin,
          ),
          children: [
            HomeButton(
              icon: Icon(Icons.security),
              label: "Permissions",
              onTap: () => Get.toNamed(PermissionScreen.name),
              permission: 'permission.index',
            ),
            HomeButton(
              icon: Icon(Icons.contact_mail),
              label: "Roles",
              onTap: () => Get.toNamed(RolesScreen.name),
              permission: 'role.index',
            ),
            HomeButton(
              icon: Icon(Icons.groups),
              label: "Users",
              onTap: ()=>Get.toNamed(UserScreen.name),
              permission: 'user.index',
            ),
            HomeButton(
              icon: Icon(Icons.description_outlined),
              label: "Catalogs",
              onTap: ()=>Get.toNamed(CatalogsScreen.name),
              permission: 'catalog.index',
            ),
            HomeButton(
              icon: Icon(Icons.reorder),
              label: "Orders",
              onTap: ()=>Get.toNamed(OrdersScreen.name),
              permission: 'order.index',
            ),
            HomeButton(
              icon: Icon(Icons.type_specimen),
              label: "Order Types",
              onTap: ()=>Get.toNamed(OrderTypesScreen.name),
              permission: 'order_type.index',
            ),
            HomeButton(
              icon: Icon(Icons.short_text),
              label: "Forms",
              onTap: ()=>Get.toNamed(FormsScreen.name),
              permission: 'form.index',
            ),
            HomeButton(
              icon: Icon(Icons.document_scanner_outlined),
              label: "Contracts",
              onTap: ()=>Get.toNamed(ContractsScreen.name),
              permission: 'contract.index',
            ),
            HomeButton(
              icon: Icon(Icons.person_2),
              label: "Clients",
              onTap: ()=>Get.toNamed(ClientsScreen.name),
              permission: 'client.index',
            ),
            HomeButton(
              icon: Icon(Icons.inventory),
              label: "Parts",
              onTap: ()=>Get.toNamed(PartsScreen.name),
              permission: 'part.index',
            ),
            HomeButton(
              icon: Icon(Icons.group),
              label: "Teams",
              onTap: ()=>Get.toNamed(TeamsScreen.name),
              permission: 'team.index',
            ),
          ],
        ),
      ),
    );
  }
}
