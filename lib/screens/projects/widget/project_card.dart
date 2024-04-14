import 'package:flutter/material.dart';
import 'package:weeidl/themes/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 565,
      decoration: BoxDecoration(
        color: AppColor.backgroundCard,
        border: Border.all(
          width: 1,
          color: AppColor.grey2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      width: double.infinity,
    );
  }
}
