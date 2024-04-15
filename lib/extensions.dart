import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 1200;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1200;
  bool get isMobileAndTablet => MediaQuery.of(this).size.width <= 1200;
  bool get isTabletAndAbove => MediaQuery.of(this).size.width >= 600;
}
