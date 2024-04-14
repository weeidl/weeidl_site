import 'package:flutter/material.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class AppOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final String text;
  final EdgeInsets? padding;
  const AppOutlineButton({
    super.key,
    required this.onPressed,
    this.color,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: color ?? Colors.white),
          ),
        ),
        padding: MaterialStateProperty.all(
          padding ??
              const EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 24,
              ),
        ), // Padding
      ),
      child: Text(
        text,
        style: AppTextStyle.body(color ?? AppColor.white),
      ),
    );
  }
}
