import 'package:flutter/material.dart';
import 'package:weeidl/extensions.dart';

class AdaptiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final bool? adaptive;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const AdaptiveRowColumn({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.adaptive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool useRow = adaptive ?? context.isMobileAndTablet;

    if (!useRow) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    }
  }
}
