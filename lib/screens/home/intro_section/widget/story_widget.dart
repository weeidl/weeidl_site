import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:o3d/o3d.dart';
import 'package:weeidl/app_outline_button.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/adaptive/adaptive_row_column.dart';
import 'package:weeidl/screens/home/intro_section/cubit/dragon_cubit.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class StoryWidget extends StatelessWidget {
  final O3DController controller;
  const StoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: context.isMobileAndTablet
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: context.isMobileAndTablet
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Container(
            padding: context.isMobileAndTablet
                ? const EdgeInsets.only(left: 44, right: 44, top: 44)
                : null,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                textAlign: context.isMobileAndTablet
                    ? TextAlign.center
                    : TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "I'm ",
                      style: AppTextStyle.title(AppColor.violet),
                    ),
                    TextSpan(
                      text: "Artur Rustamov",
                      style: AppTextStyle.title(AppColor.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(16),
          Container(
            padding: context.isMobileAndTablet
                ? const EdgeInsets.symmetric(horizontal: 44)
                : null,
            child: AutoSizeText(
              "A flutter developer, inspired by travel, new\nknowledge, and music to create unique\napplications",
              textAlign: context.isMobileAndTablet
                  ? TextAlign.center
                  : TextAlign.start,
              maxLines: 4,
              style: AppTextStyle.bioDescriptionStyle(AppColor.grey),
            ),
          ),
          const Gap(64),
          AdaptiveRowColumn(
            mainAxisAlignment: context.isMobileAndTablet
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            adaptive: context.isMobile,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                onEnter: (i) async {
                  context.read<DragonCubit>().yes();
                },
                child: AppOutlineButton(
                  onPressed: () async {},
                  text: 'See my resume',
                ),
              ),
              const Gap(20),
              MouseRegion(
                onEnter: (_) {
                  context.read<DragonCubit>().no();
                },
                child: AppOutlineButton(
                  onPressed: () {},
                  color: AppColor.grey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 72,
                    vertical: 24,
                  ),
                  text: 'Magic',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
