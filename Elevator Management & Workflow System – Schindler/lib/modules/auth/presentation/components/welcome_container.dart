import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:elevator_management_app/core/const/assets_const.dart';
import 'package:elevator_management_app/core/core_components/app_logo.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ContainerClipper(),
      child: Container(
        padding: EdgeInsets.only(
          right: 10.w,
          top: 5.vmin
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.theme.primaryColor,
              context.theme.colorScheme.background
            ]
          )
        ),
        child: Column(
          children: [
            AppLogo(
              width: 50.vmin,
            ),
            Text(
              "Welcome To Dashboard",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _ContainerClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path = Path();
    var w = size.width*.85;
    var h = size.height;
    path..
    lineTo(w, 0)..
    arcToPoint(
        Offset(w, h/4),
        clockwise: false,
        radius: Radius.circular(w * .5)
    )..
    arcToPoint(
        Offset(w, h/2),
        clockwise: true,
        radius: Radius.circular(w * .5)
    )..
    arcToPoint(
        Offset(w, 3*h/4),
        clockwise: false,
        radius: Radius.circular(w * .5)
    )..
    arcToPoint(
        Offset(w, h),
        clockwise: true,
        radius: Radius.circular(w * .5)
    )..
    lineTo(0, h)..
    lineTo(0, 0)
    ;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
