
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_app/core/storage/storage_handler.dart';
import 'package:web_app/modules/auth/presentation/screens/login_screen.dart';

import 'modules/auth/presentation/screens/register_screen.dart';
import 'modules/groups/presentation/screens/create_group_screen.dart';
import 'modules/groups/presentation/screens/group_info_screen.dart';
import 'modules/groups/presentation/screens/groups_screen.dart';
import 'modules/groups/presentation/screens/invites_screen.dart';
import 'modules/groups/presentation/screens/log_screen.dart';
import 'modules/groups/presentation/screens/members_screen.dart';
import 'modules/groups/presentation/screens/upload_requests_screen.dart';

void main() async{
  await StorageHandler.init();
  // await StorageHandler().removeToken();
  try {
    print(StorageHandler().token);
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
                RegisterScreen.page,
                LoginScreen.page,
                GroupsScreen.page,
                CreateGroupScreen.page,
                GroupInfoScreen.page,
                InvitesScreen.page,
                UploadRequestsScreen.page,
                MembersScreen.page,
                LogScreen.page
              ],
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: Colors.white,
                  centerTitle: true
                )
              ),
            )
    );
  }
}
