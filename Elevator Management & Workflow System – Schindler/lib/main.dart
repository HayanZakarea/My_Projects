
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/storage/storage_handler.dart';
import 'package:elevator_management_app/modules/auth/presentation/screens/login_screen.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/catalogs_screen.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/create_cataog_screen.dart';
import 'package:elevator_management_app/modules/catalog/presentation/screens/update_cataog_screen.dart';
import 'package:elevator_management_app/modules/forms/presentation/screens/create_form_screen.dart';
import 'package:elevator_management_app/modules/forms/presentation/screens/forms_screen.dart';
import 'package:elevator_management_app/modules/home/presentation/screens/home_screen.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/create_contract_screen.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/order_info_screen.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/order_types_screen.dart';
import 'package:elevator_management_app/modules/order/presentation/screens/orders_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/clients_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/create_role_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/create_user_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/permissions_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/role_info_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/roles_screen.dart';
import 'package:elevator_management_app/modules/users/presentation/screens/users_screen.dart';

import 'core/core_components/no_permission_screen.dart';
import 'modules/auth/presentation/screens/register_screen.dart';
import 'modules/order/presentation/screens/add_step_screen.dart';
import 'modules/order/presentation/screens/apply_step_screen.dart';
import 'modules/order/presentation/screens/check_step_screen.dart';
import 'modules/order/presentation/screens/contract_info_screen.dart';
import 'modules/order/presentation/screens/contracts_screen.dart';
import 'modules/order/presentation/screens/create_order_type_screen.dart';
import 'modules/order/presentation/screens/update_contract_screen.dart';
import 'modules/parts/presentation/screens/create_part_screen.dart';
import 'modules/parts/presentation/screens/parts_screen.dart';
import 'modules/teams/presentation/screens/create_team_screen.dart';
import 'modules/teams/presentation/screens/create_visit_screen.dart';
import 'modules/teams/presentation/screens/team_info_screen.dart';
import 'modules/teams/presentation/screens/teams_screen.dart';


void main() async{
  await StorageHandler.init();
  try {
    print(StorageHandler().token);
    // StorageHandler().removeToken();
  } catch (_) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (_,__,___)=>
            GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: [
                // RegisterScreen.page,
                LoginScreen.page,
                HomeScreen.page,
                PermissionScreen.page,//
                RolesScreen.page,//
                RolesInfoScreen.page,
                UserScreen.page,
                CreateRoleScreen.page,
                CatalogsScreen.page,
                CreateCatalogScreen.page,
                OrdersScreen.page,
                OrderInfoScreen.page,
                CreateUserScreen.page,
                FormsScreen.page,
                CreateFormScreen.page,
                OrderTypesScreen.page,
                ContractsScreen.page,
                CreateContractScreen.page,
                ClientsScreen.page,
                ContractInfoScreen.page,
                UpdateContractScreen.page,
                NoPermissionScreen.page,
                ApplyStepScreen.page,
                CheckStepScreen.page,
                CreatePartScreen.page,
                PartsScreen.page,
                TeamsScreen.page,
                CreateTeamScreen.page,
                TeamInfoScreen.page,
                UpdateCatalogScreen.page,
                CreateOrderTypeScreen.page,
                AddStepScreen.page,
                CreateVisitScreen.page,
              ],
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: const ColorScheme.dark(
                  primary: Color(0xFF009FE3),
                  secondary: Color(0xFFFFD600),
                  background: Color(0xFF121212),
                  surface: Color(0xFF1E1E1E),
                  onPrimary: Colors.white,
                  onSecondary: Colors.black,
                  onBackground: Color(0xFFBFC1BD),
                  onSurface: Colors.white70,
                ),
                scaffoldBackgroundColor: const Color(0xFF121212),
                appBarTheme: AppBarTheme(
                  backgroundColor: const Color(0xFF1E1E1E),
                  elevation: 1,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 3.vmin, // Responsive font
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                  actionsIconTheme: const IconThemeData(color: Colors.white),
                ),
                cardTheme: CardThemeData(
                  color: const Color(0xB01E1E1E),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.vmin),
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BCD4),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 3.vmin, vertical: 1.5.vmin),
                    textStyle: TextStyle(fontSize: 2.vmin, fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.vmin),
                    ),
                  ),
                ),
                textTheme: TextTheme(
                  headlineSmall: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5.vmin,
                  ),
                  bodyMedium: TextStyle(
                    color: Colors.white70,
                    fontSize: 2.vmin,
                  ),
                  labelLarge: TextStyle(
                    color: Colors.white60,
                    fontSize: 1.8.vmin,
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.vmin, vertical: 1.5.vmin),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.5.vmin),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Colors.white38, fontSize: 1.8.vmin),
                  labelStyle: TextStyle(color: Colors.white54, fontSize: 1.8.vmin),
                ),
                dividerColor: Colors.white10,

              ),
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF009FE3),
                  secondary: Color(0xFFFFD600),
                  background: Color(0xFFF5F5F5),
                  surface: Color(0xFFFFFFFF),
                  onPrimary: Colors.white,
                  onSecondary: Colors.black,
                  onBackground: Color(0xFF1A1A1A),
                  onSurface: Color(0xFF121212),
                ),
                scaffoldBackgroundColor: const Color(0xFFF5F5F5),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFFFFFFFF),
                  foregroundColor: Color(0xFF009FE3),
                  elevation: 1,
                  centerTitle: true,
                  iconTheme: IconThemeData(color: Colors.black87),
                  actionsIconTheme: IconThemeData(color: Colors.black87),
                ),
                cardTheme: CardThemeData(
                  color: const Color(0xB0F2F2F2),
                  elevation: .5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.vmin),
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BCD4),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 3.vmin, vertical: 1.5.vmin),
                    textStyle: TextStyle(fontSize: 2.vmin, fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.vmin),
                    ),
                  ),
                ),
                textTheme: TextTheme(
                  headlineSmall: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5.vmin,
                  ),
                  bodyMedium: TextStyle(
                    color: Colors.black87,
                    fontSize: 2.vmin,
                  ),
                  labelLarge: TextStyle(
                    color: Colors.black54,
                    fontSize: 1.8.vmin,
                  ),
                ),
                dividerColor: Colors.black12,
                listTileTheme: ListTileThemeData(
                  titleTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 3.vmin,
                  ),
                  subtitleTextStyle: TextStyle(
                    color: const Color(0xFF009FE3),
                    fontSize: 2.5.vmin,
                  ),
                )
              ),
            )
    );
  }
}
