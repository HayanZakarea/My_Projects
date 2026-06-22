import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/permissions/user_permissions.dart';

class HomeButton extends StatelessWidget {

  const HomeButton({super.key, required this.label, required this.icon, this.onTap, required this.permission});

  final String label;
  final String permission;
  final Widget icon;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: UserPermissions().protect(permission,onTap),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconTheme(
                  data: IconThemeData(
                    size: 7.5.vmin,
                    color: UserPermissions().protect(
                        permission,
                        context.theme.colorScheme.onSurface,
                        replacement: context.theme.colorScheme.onSurface.withAlpha(100)
                    )
                  ),
                  child: icon,
                )
              ),
            ),
            Expanded(
                child: Center(
                    child: Text(
                      label,
                    ))
            )
          ],
        ),
      ),
    );
  }
}
