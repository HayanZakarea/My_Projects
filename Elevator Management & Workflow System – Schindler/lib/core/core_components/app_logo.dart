import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/assets_const.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width});

  final double? width;


  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AssetsConst.logo,
        width: width ?? 20.vmin,
    );
  }
}
