import 'package:flutter/material.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class WindowWidget extends StatelessWidget {
  final Widget child;
  final String title;
  const WindowWidget({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.white.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 12, color: Colors.red),
                const SizedBox(width: 8),
                const Icon(Icons.circle, size: 12, color: Colors.yellow),
                const SizedBox(width: 8),
                const Icon(Icons.circle, size: 12, color: Colors.green),
                const Spacer(flex: 9),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body(AppColor.white),
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
          Divider(
            color: AppColor.white.withOpacity(0.04),
            height: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
