import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weeidl/screens/projects/widget/project_card.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class SelectedWork extends StatelessWidget {
  const SelectedWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(124),
            Text(
              'Selected Work',
              style: AppTextStyle.titleBold(AppColor.white),
            ),
            const Gap(32),
            const ProjectCard(),
            const Gap(24),
            const ProjectCard(),
            const Gap(124),
          ],
        ),
      ),
    );
  }
}
