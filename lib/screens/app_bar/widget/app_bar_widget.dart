// Flutter imports:
import 'package:flutter/material.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class AppBarWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const AppBarWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              text,
              style: AppTextStyle.tapBar(
                isSelected ? AppColor.white : AppColor.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
