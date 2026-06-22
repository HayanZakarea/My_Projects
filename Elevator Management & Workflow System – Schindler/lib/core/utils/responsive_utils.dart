
import 'dart:math';

import 'package:responsive_sizer/responsive_sizer.dart';

class ResponsiveUtils {
  static int get gridFullCount {
    var aspectRatio = Device.aspectRatio;
    print(aspectRatio);
    if(aspectRatio < 1) {
      return 2;
    }else if (aspectRatio < 1.5){
      return 3;
    }
    return 4;
  }
}

extension MaxSpa on num {
  double maxSpa(double max) => min(spa,max);
}