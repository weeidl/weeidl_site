import 'package:flutter/material.dart';
import 'package:weeidl/extensions.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const AdaptiveText(this.text,
      {Key? key, this.style, this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = style?.fontSize ?? 16;

    if (context.isMobileAndTablet) {
      fontSize *= 1.2;
    } else if (context.isTabletAndAbove) {
      fontSize *= 1.4;
    }

    return Text(
      text,
      style:
          style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
      textAlign: textAlign,
    );
  }
}
