import 'package:flutter/material.dart';
import 'package:weeidl/extensions.dart';

class AdaptivePadding {
  static EdgeInsets all(BuildContext context, double num) {
    return EdgeInsets.all(context.isMobile ? num / 2 : num);
  }

  static EdgeInsets only({
    required BuildContext context,
    double top = 0,
    double bottom = 0,
    double right = 0,
    double left = 0,
  }) {
    return EdgeInsets.only(
      top: !context.isDesktop ? top / 2 : top,
      bottom: !context.isDesktop ? bottom / 2 : bottom,
      right: !context.isDesktop ? right / 2 : right,
      left: !context.isDesktop ? left / 2 : left,
    );
  }
}
